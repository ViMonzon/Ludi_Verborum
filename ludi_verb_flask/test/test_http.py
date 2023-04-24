import requests

# Crear un usuario
url = 'http://localhost:5000/create'
data = {
    'email': 'ejemplo@gmail.com',
    'password': 'contraseña123'
}
response = requests.post(url, json=data)
print(response.text)

# Iniciar sesión
url = 'http://localhost:5000/login'
data = {
    'email': 'ejemplo@gmail.com',
    'password': 'contraseña123'
}
response = requests.post(url, json=data)
print(response.text)

# Agregar una palabra para el usuario autenticado
url = 'http://localhost:5000/add'
data = {
    'word': 'ejemplo'
}
headers = {'Authorization': f'Bearer {response.json()}'}
response = requests.post(url, json=data, headers=headers)
print(response.text)

# Cerrar sesión
url = 'http://localhost:5000/logout'
headers = {'Authorization': f'Bearer {response.json()}'}
response = requests.get(url, headers=headers)
print(response.text)