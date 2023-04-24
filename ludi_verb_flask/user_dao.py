import firebase_authentication as fb_auth
from firebase_admin import firestore
from firebase_admin import firestore
from firebase_admin import credentials
import firebase_admin
import scrap_rae
from user import User


#Conexión con firebase
cred = credentials.Certificate("serviceAccountKey.json")
default_app = firebase_admin.initialize_app(cred)


class UserDAO:
    def __init__(self):
        self.db = firestore.client()

    def create_user(self, email, password):        
        fb_auth.create_user(email, password)
        print(f'El usuario {email} se ha creado.')


    def find_user_by_email(self, email):
        # Busca el usuario por email en Firebase Authentication
        return fb_auth.get_user_by_email(email)

    def authenticate_user(self, email, password):
        # Autentica al usuario en Firebase Authentication
        return fb_auth.login(email, password)
        
    def get_words(self,user_email, letter):
        db = firestore.client()
        letter_collection = db.collection('users').document(user_email).collection("letter")

        word_collection = letter_collection.document(letter).collection("word").get()
        words = [word.id for word in word_collection]
        print(words)
            
        return words
    
    def get_words(self,user_email):
        db = firestore.client()
        letter_collection = db.collection('users').document(user_email).collection("letter")
        letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'l', 'm', 'n', 'ñ', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'y', 'z']
        words = []
        for letter in letters:
            word_collection = letter_collection.document(letter).collection("word").get()
            words.extend([word.id for word in word_collection])
        print("esto son las palabras:" + str(words))
             
        return words

    def add_word_to_dic(self, user_email, word):
        word_f = scrap_rae.myword(word)
        db = firestore.client()
        db.collection('users').document(user_email).collection("letter").document(word[0]).collection("word").document(word).set(word_f)