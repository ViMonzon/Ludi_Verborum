from flask_login import LoginManager, UserMixin

login_manager = LoginManager()

class User(UserMixin):
    def __init__(self, email):
        self.email = email

    def get_id(self):
        return self.email

    @login_manager.user_loader
    def load_user(email):
        # Código para recuperar el usuario de la base de datos
        return User(email)