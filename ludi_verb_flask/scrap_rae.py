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
    definition = soup.find_all('p', {'class': 'j'})
    definition1 = soup.find_all('p', {'class': 'j1'})
    definition2 = soup.find_all('p', {'class': 'j2'})

    defs = []
    defs1 =[]
    defs2 = []


    for i in definition:
        #for a in i.find_all('a', href=True):
            #a.extract()
        defs.append(i.text)
    
    for i in definition1:
        #for a in i.find_all('a', href=True):
            #a.extract()
        defs1.append(i.text)


    for i in definition2:
        #for a in i.find_all('a', href=True):
        # defs.append(i.text)

        defs2.append(i.text)


    defs.extend(defs2)
    defs.extend(defs1)
    print (defs)
    defs_validas = []

    for i in defs:
        palabras = i.split()

        #if len(palabras) > 3:
        defs_validas.append(i)

    #defs_validas = [i for i in defs_validas if '(‖' not in i]

    def_string_val = '\n'.join(defs_validas)

    print(def_string_val)
    nueva_palabra = {
    "palabra": word,
    "definiciones": defs
    }
    return nueva_palabra