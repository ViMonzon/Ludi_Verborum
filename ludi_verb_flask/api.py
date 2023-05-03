from flask import Flask, request, render_template

from markupsafe import escape

from firebase_admin import firestore
from firebase_admin import credentials
import firebase_admin
from flask_login import login_user, logout_user, login_required
from flask_login import current_user
from user import User

from flask_login import LoginManager

from user_dao import UserDAO, default_app

user_dao = UserDAO()

#Conexión con firebase
app = Flask(__name__)
app.config['SECRET_KEY'] = 'bf117c9abb11f9e8e9fe07dc94ff7800'

login_manager = LoginManager()
login_manager.init_app(app)

users = []
default_words = ['almendra', 'alondra', 'barco', 'casa', 'dedo', 'elefante', 'flor', 'gato', 'helado', 'iglesia',
'jardín', 'luna', 'manzana', 'nube', 'ojo', 'perro', 'queso', 'ratón', 'sol', 'tigre', 'uva', 'vaca',
'zapato', 'árbol', 'boca', 'carro', 'diente', 'escalera', 'fuego', 'guitarra', 'hueso', 'isla', 'juego',
'león', 'mariposa', 'nido', 'oso', 'pájaro', 'quesadilla', 'rana', 'silla', 'tren', 'unicornio', 'vino', 'zapatilla']

#Gestión de usuarios de Flask
@login_manager.user_loader
def load_user(user_id):
    for user in users:
        if user.get_id() == user_id:
            return user
    return None
""""
@login_manager.user_loader
def load_user(user_id):
    user_doc = user_dao.get_user(user_id)
    if user_doc.exists:
        user_data = user_doc.to_dict()
        user = User(user_data['email'])
        user.id = user_id
        return user
    return None
"""

@app.route('/register', methods=['POST'])
def create():
    #email = request.json['email']
    #password = request.json['password']

    email = request.form['email']
    password = request.form['password']
    print(request.form)
    user_dao.create_user(email, password)
    print(f'El usuario {email} se ha creado.')
    for word in default_words:
        user_dao.add_word_to_dic(email, word)
    auth_result = user_dao.authenticate_user(email, password)
    if auth_result[0]:
        user = User(email)
        users.append(user)
        login_user(user)
        print(f'El usuario {email} se ha unido.')
    return render_template('word.html')


@app.route('/login', methods=['POST'])
def login():

    #email = request.json['email'] 
    #password = request.json['password']

    email = request.form['email'] 
    password = request.form['password']
    auth_result = user_dao.authenticate_user(email, password)
    if auth_result[0]:
        user = User(email)
        users.append(user)
        login_user(user)
        print(f'El usuario {email} se ha unido.')
        try:
            return render_template('word.html')
        except Exception as e:
            app.logger.error(str(e))
            return 'Error: ' + str(e), 500
    else:
        return "Error: Email o password inválidos", 401

@app.route('/', methods=['POST', 'GET'])
def hello():
    try:
        return render_template('home.html')
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500

@app.route('/dictionary', methods=['GET'])
@login_required
def list_dictionary():
    print(current_user.is_authenticated)
    if not current_user.is_authenticated:
        return 'Usuario no autenticado', 401
    print(current_user.email)    
    user_email = current_user.email
    try:
        words = user_dao.get_words(user_email)
        if words is not None:  # Verificar si words es None
            return render_template('dictionary.html', words=words)
        else:
            return 'No hay palabras en la colección', 200
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500

@app.route('/game', methods=['GET'])
@login_required
def list_game():
    print(current_user.is_authenticated)
    if not current_user.is_authenticated:
        return 'Usuario no autenticado', 401
    print(current_user.is_authenticated)
    user_email = current_user.email
    try:
        words = user_dao.get_random_words(user_email)
        if words is not None:  # Verificar si words es None
            return render_template('dictionary.html', words=words)
        else:
            return 'No hay palabras en la colección', 200
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500

@app.route('/add', methods=['POST'])
@login_required
def add():
    if not current_user.is_authenticated:
        return 'Usuario no autenticado', 401
    
    #word = request.json['word']
    word_f = request.form['word']
    user_email = current_user.email   
    user_dao.add_word_to_dic(user_email, word_f)
    return render_template('word.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return f'Logout exitoso de (current_user.email)!'

#PUERTO 5000 por defecto: http://localhost:5000/
if __name__ == "__main__":
    app.run()