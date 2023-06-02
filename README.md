
![](letras_ludi_color.png)




Ludi Verborum es una aplicación móvil de juego desarrollada en Flutter, Python y Firebase. El objetivo principal del juego es adivinar palabras utilizando las pistas proporcionadas que son, las definiciones y la inicial de la palabra. 
Una característica única de la aplicación es que las definiciones se obtienen directamente desde la web de la RAE, esto garantiza que la información esté siempre actualizada y precisa. 

## Características del juego

- Interfaz de usuario intuitiva y atractiva.
- Posibilidad de añadir y ampliar tu diccionario.
- Integración con Firebase para almacenamiento y autenticación de usuarios.
- Posibilidad de cambiar la dificultad del juego.

## Tecnologías que se han usado

- Flutter: Un framework de desarrollo de aplicaciones móviles multiplataforma basado en Dart.
- Python: Utilizado para el desarrollo del server que almacena la información que se recoge con un scraper de la RAE.
- Firebase: Una plataforma de desarrollo de aplicaciones móviles en la nube que proporciona servicios como autenticación de usuarios y almacenamiento de datos en tiempo real.
- Github: Para el control de versiones y el desarrollo colaborativo de la aplicación.

## Ejecutables 
- Descomprimir archivo ludi_verborum_exe.zip. En este se encuentra el ejecuatable del servidor Python (junto con las credenciales de la base de datos de FireBase que se pueden modificar en caso de que se quiera usar uno propio y el apk para instalarlo en el emulador.
- Por el momento funciona en entorno local.  


## Instalación y ejecución para desarrollo

1. Clona este repositorio en tu máquina local:
    
    ```powershell
    git clone https://github.com/ViMonzon/Ludi_Verborum.git
    ```
    

1. El repositorio consta de dos partes, necesarias para la ejecución de la aplicación,
- SERVER
    
    **ludi_verb_flask**
    
    Esta parte se podrá ejecutar con Visual Studio,
    
    Versión: 1.78.2 (user setup)
    Commit: b3e4e68a0bc097f0ae7907b217c1119af9e03435
    Fecha: 2023-05-10T14:39:26.248Z
    Electrón: 22.5.2
    Chromium: 108.0.5359.215
    Node.js: 16.17.1
    V8: 10.8.168.25-electron.0
    OS: Windows_NT x64 10.0.22621
    En espacio aislado: Yes
    
    Esta carpeta tiene dentro un fichero requirements.txt donde se detallan las dependencias y las carpetas requeridos. 
    
    Para ejecutar este código debemos abrir el terminal y ejecutar,
    
    ```python
    python api2.py
    ```
    
    Este comando ejecuta tanto el scraper, como levantar el server.

**Nota** Se mantiene el archivo api.py para poder demostrar el funcionamiento y las pruebas en los primeros estadios del desarrllo para poder desarrollar tanto la app(flutter) como el server de manera simultánea.
    
- APP
    
    **ludi_verborum**
    
    Esta parte también se podrá ejecutar en Visual Studio, la misma versión que indicamos en el punto anterior. 
    
    Este proyecto tiene un fichero pubspec.yaml para gestionar las dependencias y los paquetes requeridos. 
    
    Ejecuta el siguiente comando para obtener las dependencias necesarias:
    
    ```dart
    flutter pub get
    ```
    
    Finalmente, puedes ejecutar la aplicación en un emulador de Android o en un dispositivo físico:
    
    ```dart
    flutter run
    ```
    

## ¿Cómo juego?

Una vez hayamos ejecutado la aplicación, lo primero que vamos a encontrar es el Splash, con el logo de la aplicación, tras esto encontraremos la pantalla de login, aquí podemos crear una cuenta nueva o loguearnos con nuestro mail y contraseña.

Ahora llegaremos al menú, en el que veremos todas las opciones de la aplicación, podemos ir al juego, añadir una palabra, ver y gestionar el diccionario, modificar las opciones o cerrar la sesión.

El juego consiste en adivinar las palabras con las pistas que tenemos, estas son las definiciones y la inicial de la letra, al finalizar el tiempo o contestar todas las letras, veremos nuestro resultado. 

Para añadir palabras en el juego tenemos la pantalla de añadir palabra, cuando añadamos la palabra la aplicación automáticamente irá a la fuente y descargará todas las definiciones de dicha palabra, para almacenarlo en nuestro diccionario.

El diccionario será el mismo para todos los usuarios nuevos, una vez registrados podrán borrar y añadir las palabras a su elección, lo que hará que el diccionario sea personal. Además verán las definiciones de las palabras.

En la pantalla de opciones el usuario podrá cambiar su nombre de usuario o cambiar el tiempo del temporizador, esto afectará a la dificultad del juego. En cuanto al nombre de usuario, se verá en la pantalla del menú, sino cambiamos el nombre de usuario se verá el mail con el que se ha registrado el usuario.

## Autores

Victor Manuel Monzón Pérez

Luz María Lozano Asimbaya
