import pyrebase
from firebase_admin import auth

# Configura la instancia de Firebase
import json

with open('firebase_config.json') as f:
    config = json.load(f)


firebase = pyrebase.initialize_app(config)
db = firebase.database()
auth = firebase.auth()

def login(email, password):
#Autenticación de usuario con email y contraseña
    try:
        auth.sign_in_with_email_and_password(email, password)
        print("Inicio de sesión exitoso")
        return True, None
    except Exception as e:
        print(f"Inicio de sesión fallido: {e}")
        return False, str(e)

#!!!DESACTUALIZADO!!!#
#Creación de usurio.
#No utilizado por el uso de alternativa:
def create_user(email, password):
    try:
        user = auth.create_user_with_email_and_password(email, password)
        print('Successfully created new user: {0}'.format(user.email))
        return True, None
    except Exception as e:
        print(f"Inicio de sesión fallido: {e} Email ya existe")
        return False, str(e)