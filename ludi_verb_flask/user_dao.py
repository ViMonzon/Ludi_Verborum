
from firebase_admin import firestore
from firebase_admin import credentials
from firebase_admin import auth
import firebase_admin
from firebase_authentication import login
import scrap_rae
from unidecode import unidecode
import random


#Conexión con firebase
cred = credentials.Certificate("serviceAccountKey.json")
default_app = firebase_admin.initialize_app(cred)
letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'l', 'm', 'n', 'ñ', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'y', 'z']

class UserDAO:
    def __init__(self):
        self.db = firestore.client()

    def create_user(self, email, password):
        try:
            if self.find_user_by_email(email):
                print('El usuario ya existe')
                return False, 'El usuario ya existe'
            user = auth.create_user(
                email=email,
                password=password
            )
            print('Successfully created new user: {0}'.format(user.email))
            return True, None
        except Exception as e:
            print(f"Inicio de sesión fallido: {e} Email ya existe")
            return False, str(e)

    def find_user_by_email(self, email):
        # Busca el usuario por email en Firebase Authentication
        try:
            user = auth.get_user_by_email(email)
            return user
        except Exception as e:
            return None
    
    def get_user(self, uid):
        # Código del método get_user
        try:
            user = auth.get_user(uid)
            print(user)
            print(uid)
            return user
        except Exception as e:
            print(f"No se pudo encontrar al usuario con uid {uid}: {e}")
            return None

    def authenticate_user(self, email, password):
    # Autentica al usuario en Firebase Authentication
        return login(email, password)
        
        
    def get_words_letter(self, user_email, letter):
        db = firestore.client()
        letter_collection = db.collection('users').document(user_email).collection("letter")

        word_collection = letter_collection.document(letter).collection("word").get()
        words = [word.id for word in word_collection]
        print(words)            
        return words
    
    def get_words(self,user_email):
        db = firestore.client()
        letter_collection = db.collection('users').document(user_email).collection("letter")
        words = []
        for letter in letters:
            word_collection = letter_collection.document(letter).collection("word").get()
            words.extend([word.id for word in word_collection])
        print("esto son las palabras:" + str(words))            
        return words

    def get_all_word(self,user_email):
        db=firestore.client()
        letter_collection = db.collection('users').document(user_email).collection("letter")
        words = []
        for letter in letters:
            word_collection = letter_collection.document(letter).collection("word")
            for word in word_collection:
                word_ref = word_collection.document(word).get()
                words.extend(word_ref)
        return words


    def check_word_dict(self, user_email, word):
        words = self.get_words_letter(user_email, word[0])
        for word_res in words:
            print(word_res + "=?" + word) 
            if word_res.strip().lower() == word.strip().lower():
                return False
        return True


    def add_word_to_dic(self, user_email, word):
        if self.check_word_dict(user_email, word):
            word_f = scrap_rae.myword(word)
            db = firestore.client()
            print(word_f["definiciones"])
            if "definiciones" in word_f and word_f["definiciones"]:
                db.collection('users').document(user_email).collection("letter").document(unidecode(word[0])).collection("word").document(word).set(word_f)
                return word_f
            else:
                return None
        else:
            return False
        

    def delete_word_to_dic(self, user_email, word):
        db = firestore.client()
        db.collection('users').document(user_email).collection("letter").document(unidecode(word[0])).collection("word").document(word).delete()

    def get_random_words(self, user_email):
        db = firestore.client()
        word_list=[]
        for letter in letters:
            word_ref = db.collection('users').document(user_email).collection('letter').document(letter).collection('word').get()
            if word_ref:
                word_doc = random.choice(word_ref)
                word = word_doc.id
                definitions = word_doc.to_dict().get('definiciones', [])
                if definitions:
                    random_definition = random.choice(definitions)
                    word_dict = {"palabra": word, "definicion": random_definition}
                    word_list.append(word_dict)
                    print(word_list)
                else:
                    print(f"No se encontraron definiciones para la palabra {word}.")
            else:
                print(f"No se encontraron palabras para la letra {letter}.")
        print(word_list)
        return word_list