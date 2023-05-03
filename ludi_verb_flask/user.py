from flask_login import LoginManager, UserMixin

login_manager = LoginManager()

class User(UserMixin):
    def __init__(self, email, active=True):
        self.name = email
        self.active = active

    def is_active(self):
        # Here you should write whatever the code is
        # that checks the database if your user is active
        return self.active

    def is_anonymous(self):
        return False

    def is_authenticated(self):
        return True