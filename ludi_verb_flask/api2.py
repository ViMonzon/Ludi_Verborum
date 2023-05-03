from flask import Flask, request, render_template, json, jsonify

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
    return User.get(user_id)


def authenticate_and_login_user(email, password):
    auth_result = user_dao.authenticate_user(email, password)
    if auth_result[0]:
        user = User(email)
        user.id = email
        login_user(user, remember=True)
        print(current_user.is_authenticated)
        print(f'El usuario {email} se ha unido.')
        return True
    return False

@app.route('/register', methods=['POST'])
def create():
    if 'email' not in request.json or 'password' not in request.json:
        return "Error: faltan datos requeridos (email y/o password)", 400
    email = request.json['email']
    password = request.json['password']
    print(request.json)
    
    if user_dao.create_user(email, password)[0]:
        print(f'El usuario {email} se ha creado.')
        for word in default_words:
            user_dao.add_word_to_dic(email, word)
    else:
        return jsonify(["user alredy exist"])
    if authenticate_and_login_user(email, password):
        return jsonify(["Register success"])
    else:
        return jsonify(["Wrong Credentials"])

@app.route('/login', methods=['POST'])
def login():
    if 'email' not in request.json or 'password' not in request.json:
        return "Error: faltan datos requeridos (email y/o password)", 400
    email = request.json['email']
    password = request.json['password']
    print(request.json)
    if authenticate_and_login_user(email, password):
        try:
            return jsonify([ "success"])
        except Exception as e:
            app.logger.error(str(e))
            return 'Error: ' + str(e), 500
    else:
        return jsonify(["Wrong Credentials"])

@app.route('/', methods=['POST', 'GET'])
def hello():
    try:
        return render_template('home.html')
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500

@app.route('/dictionary', methods=['POST'])
def list_dict():
    user_email = request.json['email']
    try:
        words = user_dao.get_words(user_email)
        if words is not None:  # Verificar si words es None
            return jsonify('words')
        else:
            return 'No hay palabras en la colección', 400
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500

@app.route('/game', methods=['POST'])
def list_game():
    user_email = request.json['email']
    try:
        words = user_dao.get_random_words(user_email)
        if words is not None:  # Verificar si words es None
            return jsonify(words)
        else:
            return 'No hay palabras en la colección', 400
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500


@app.route('/add', methods=['POST'])
@login_required
def add():
    if not current_user.is_authenticated:
        return 'Usuario no autenticado', 401
    try:
        word_f = request.json['word']
        user_email = current_user.email   
        user_dao.add_word_to_dic(user_email, word_f)
        if word_f is not None:  # Verificar si words es None
            return jsonify(word_f)
        else:
            return 'No hay palabra', 400
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return f'Logout exitoso de (current_user.email)!'

#PUERTO 5000 por defecto: http://localhost:5000/
if __name__ == "__main__":
    app.run(threaded = True )