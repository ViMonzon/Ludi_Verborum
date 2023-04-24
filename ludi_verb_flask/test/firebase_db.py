import firebase_authentication
import scrap_rae
import firebase_admin
from flask import Flask, json
from firebase_admin import credentials
from firebase_admin import firestore
from firebase_admin import auth


cred = credentials.Certificate("Scrap\serviceAccountKey.json")
firebase_admin.initialize_app(cred)

email, password = firebase_authentication.login()

palabra = scrap_rae.myword()

db = firestore.client()
db.collection('users').document(email).collection("words").add(palabra)
