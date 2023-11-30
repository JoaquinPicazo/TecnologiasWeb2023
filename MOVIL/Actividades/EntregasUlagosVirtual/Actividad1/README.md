# FUNCIONAMIENTO Y EJECUCIÓN

## Ejecución
Primero, hay que tener todo lo necesario instalado (Flutter, Dart, extensiones, elementos necesarios en el Path, etc...).
En Visual Studio Code se accede a la ubicación del archivo, se abre la consola y se ingresa el comando "flutter run". 
Al estar conectado el Smartphone mediante USB, teniendo en cuenta que tiene las opciones de desarrollador y la
configuración correspondiente, se abrirá la aplicación en el dispositivo. Al hacer click en el botón, se imprimirá en la terminal
un mensaje de "Hola Mundo".


## Imports
Se importan los elementos necesarios para la ejecución de la aplicación.


## Void main()
Es la función main y ejecuta la aplicación.


## class MyApp
Extiende de StatelessWidget.
Retorna el MaterialApp que es para configurar el diseño y el comportamiento de la aplicación.


# Scaffold
Es la base de la interfaz de la aplicación


# AppBar
Contiene solo el título de la aplicación


# Body
Tiene centrado los elementos, pero en este caso solo contiene un botón que al hacer click 
genera un "Hola Mundo" en la terminal.

