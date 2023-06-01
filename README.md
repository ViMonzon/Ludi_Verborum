# LUDI VERBORUM

Ludi Verborum es una aplicación móvil que consiste en un juego de adivinación, el objetivo del juego es adivinar la palabra correcta utilizando las pistas proporcionadas.

## Características de la aplicación

- Juego de adivinanzas de palabras basado en definiciones y letras iniciales.
- Interfaz de usuario intuitiva y atractiva.
- Posibilidad de añadir y ampliar tu diccionario.
- Integración con Firebase para almacenamiento y autenticación de usuarios.
- Posibilidad de cambiar la dificultad del juego.

## Tecnologías que se han usado

- Flutter: Un framework de desarrollo de aplicaciones móviles multiplataforma basado en Dart.
- Python: Utilizado para el desarrollo del server que almacena la información que se recoge con un scraper de la RAE.
- Firebase: Una plataforma de desarrollo de aplicaciones móviles en la nube que proporciona servicios como autenticación de usuarios y almacenamiento de datos en tiempo real.
- Github: Para el control de versiones y el desarrollo colaborativo de la aplicación.

## Preview de la aplicación

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4a90b806-18ea-4579-a858-9648f48362be/Untitled.png)

## Instalación y ejecución

1. Clona este repositorio en tu máquina local:
    
    ```powershell
    git clone https://github.com/ViMonzon/Ludi_Verborum.git
    ```
    

1. El repositorio consta de dos partes, necesarias para la ejecución de la aplicación,
- SERVER y SCRAPER
    
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

Una vez hayamos ejecutado la aplicación, detallamos lo que vamos a ir encontrando, lo primero que vamos a encontrar es el Splash, con el logo de la aplicación,

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/385ad635-3766-4d3b-baf2-bafbacc00f79/Untitled.png)

Tras esto encontraremos la pantalla de login, aquí podemos crear una cuenta nueva o loguearnos con nuestro mail y contraseña, 

https://github.com/ViMonzon/Ludi_Verborum/assets/78167402/344d4fb9-df00-4aa1-a825-f33dbb88e4c0

Tras esto llegaremos al menú, en el que veremos todas las opciones de la aplicación, podemos ir al juego, añadir una palabra, ver y gestionar el diccionario, modificar las opciones o cerrar la sesión

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a145d407-77cb-45a5-afcb-25cbf2ee7ae6/Untitled.png)

El juego consiste en adivinar las palabras con las pistas que tenemos, estas son las definiciones y la inicial de la letra, al finalizar el tiempo o contestar todas las letras , veremos nuestro resultado. 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/10bb7478-b6d3-4644-9736-2d668e0c48ed/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/08a8b0eb-44e8-469e-bdb6-c5cc08498fd7/Untitled.png)

Para añadir palabras en el juego tenemos la pantalla de añadir palabra, cuando añadamos la palabra la aplicación automáticamente irá a la fuente y descargará todas las definiciones de dicha palabra, para almacenarlo en nuestro diccionario

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/454e4e94-7e2f-4fcf-92c6-8b58691662f9/Untitled.png)

El diccionario será el mismo para todos los usuarios nuevos, una vez registrados podrán borrar y añadir las palabras a su elección, lo que hará que el diccionario sea personal. Además verán las definiciones de las palabras

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/de769021-8edd-40b0-9db8-177d888564d4/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fc108359-ae8b-48f3-86f5-fd24ea5d3893/Untitled.png)

En la pantalla de opciones el usuario podrá cambiar su nombre de usuario y cambiar el tiempo del temporizador, esto afectará a la dificultad del juego. En cuanto al nombre de usuario, se verá en la pantalla del menú, sino cambiamos el nombre de usuario se verá el mail con el que se ha registrado el usuario.
