import requests
from bs4 import BeautifulSoup as bs
import pandas as pd
import numpy as np


def myword(word):

    url = 'https://dle.rae.es/' + word
    print(url)

    headers = {
        'User-Agent': 'Mozilla/5.0(Windows NT 10.0; Win65; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029110 Safari/537.3'}
    response = requests.get(url, headers=headers)
    soup = bs(response.content, 'html.parser')
    #Reunir todos la informacion de las clases "j"
    definitions = soup.find_all('p', {'class': ['j', 'j1', 'j2']})

    defs = []
    #Eliminar los elementos internos con la clase "h" y añadir todo en un array def
    for d in definitions:
        for h in d.find_all('span', {'class': 'h'}):
            h.extract()  
        defs.append(d.text)

    #organizar las entradas del diccionario
    def_string_val = '\n'.join(defs)

    #Crear y devolver el diccionario para trabajar con FireBase
    print(def_string_val)
    nueva_palabra = {
        "palabra": word,
        "definiciones": defs
    }
    return nueva_palabra
