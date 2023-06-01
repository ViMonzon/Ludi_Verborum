from flask import Flask, request, render_template, json, jsonify, redirect, url_for

from flask_login import login_user, logout_user, login_required
from flask_login import current_user
from user import User

from werkzeug.serving import WSGIRequestHandler

from flask_login import LoginManager

from user_dao import UserDAO, default_app

user_dao = UserDAO()

# Conexión con firebase
app = Flask(__name__)
app.config['SECRET_KEY'] = 'bf117c9abb11f9e8e9fe07dc94ff7800'

login_manager = LoginManager()
login_manager.init_app(app)

users = []
default_words = ['almendra', 'alondra', 'barco', 'casa', 'dedo', 'elefante', 'flor', 'gato', 'helado', 'iglesia',
                 'jardín', 'luna', 'manzana', 'nube', 'ojo', 'perro', 'queso', 'ratón', 'sol', 'tigre', 'uva', 'vaca',
                 'zapato', 'árbol', 'boca', 'carro', 'diente', 'escalera', 'fuego', 'guitarra', 'hueso', 'isla', 'juego',
                 'león', 'mariposa', 'nido', 'oso', 'pájaro', 'quesadilla', 'rana', 'silla', 'tren', 'unicornio', 'vino', 'zapatilla']

# Gestión de usuarios de Flask
# Método utilizado en Api Web. Actualmente no es utilizado.
@login_manager.user_loader
def load_user(user_id):
    return User.get(user_id)

#Método para autenticación de usuario. Utilizado en métodos posteriores.
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

#Método de registro. 
#Recibe de la app JSON con email y password.
#Crea un nuevo usuario y añade diccionario.
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

#Método de registro. 
#Recibe de la app JSON con email y password.
#Comprueba la validez del usuario almacenado en FireBase y devuelve error en caso de no ser válido.
@app.route('/login', methods=['POST'])
def login():
    if 'email' not in request.json or 'password' not in request.json:
        return "Error: faltan datos requeridos (email y/o password)", 400
    email = request.json['email']
    password = request.json['password']
    print(request.json)
    if authenticate_and_login_user(email, password):
        try:
            return jsonify(["success"])
        except Exception as e:
            app.logger.error(str(e))
            return 'Error: ' + str(e), 500
    else:
        return jsonify(["Wrong Credentials"])

#Método para levantar un temaplate y chequear que el server está levantado.
#No utilizado en la App.
@app.route('/', methods=['POST', 'GET'])
def init():
    try:
        return render_template('home.html')
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500

#Método para listar diccionario 
#Recibe un JSON con email del usuario.
#devuelve un listado de palabras en JSON.
@app.route('/dictionary', methods=['POST'])
def list_dict():
    user_email = request.json['email']
    try:
        words = user_dao.get_words(user_email)
        if words is not None:  # Verificar si words es None
            return jsonify(words)
        else:
            return 'No hay palabras en la colección', 400
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500

#Método para juego
#Recibe un JSON con email del usuario.
#Devuelve un listado de palabras y definiciones al azar en JSON.
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

#Método para listar definicioes de palabras
#Recibe un JSON con email del usuario y palabra
#Devuelve un listado de definiciones en JSON.
@app.route('/definitions', methods=['POST'])
def list_def():    
        user_email = request.json['email']
        word_f = request.json['word']
        print(user_email + word_f)  
        definitions = user_dao.get_def(user_email,word_f)
        print(definitions)
    #try:
        if definitions is not None: 
            return jsonify(definitions)
        else:
            return 'No hay definiciones en la colección', 400
            """
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500
"""
#Método para añadir nueva palabra y sus definiciones.
#Recibe un JSON con email del usuario y palabra.
#Devuelve confirmación o error.
@app.route('/add', methods=['POST'])
def add():    
    try:
        user_email = request.json['email']
        word_f = request.json['word']
        if user_dao.check_word_dict(user_email, word_f):
            word = user_dao.add_word_to_dic(user_email, word_f)
            if word is not None:  # Verificar si words es None
                return jsonify(word_f)
            else:
                return 'No hay palabra', 400
        else:
            return jsonify(["Palabra " + word_f + " ya existe"])
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500

#Método para borrar palabra y sus definiciones.
#Recibe un JSON con email del usuario y palabra.
#Devuelve confirmación o error.
@app.route('/delete', methods=['POST'])
def delete():
    try:
        user_email = request.json['email']
        word_f = request.json['word']
        user_dao.delete_word_to_dic(user_email, word_f)
        if word_f is not None:  # Verificar si words es None
            return 'Palabra borrada', 200
        else:
            return 'No hay palabra', 400
    except Exception as e:
        app.logger.error(str(e))
        return 'Error: ' + str(e), 500
    
#Método logout. No utilizado en esta App. Posible implementación futura.
@app.route('/logout', methods=['GET', 'POST'])
@login_required
def logout():
    logout_user()
    return redirect(url_for('/login'))


# PUERTO 5000 por defecto: http://localhost:5000/
if __name__ == "__main__":
    WSGIRequestHandler.protocol_version = "HTTP/1.1" #Arreglar Bug Connection closed while receiving data
    app.run(threaded=True)
