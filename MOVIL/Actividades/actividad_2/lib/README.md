# FUNCIONAMIENTO DE APLICACIÓN Y COMO EJECUTARLA

## Ejecución
Primero, hay que tener todo lo necesario instalado (Flutter, Dart, extensiones, elementos necesarios en el Path, etc...).
En Visual Studio Code se accede a la ubicación del archivo, se abre la consola y se ingresa el comando "flutter run". 
Al estar conectado el Smartphone mediante USB, teniendo en cuenta que tiene las opciones de desarrollador y la
configuración correspondiente, se abrirá la aplicación en el dispositivo.


## Imports
Se usa para importar los paquetes necesarios para usar funcionalidades en el código.


## Void main()
Es el main, ejecuta la aplicacion MyApp().


## Class MyApp
Esta clase se extiende de StatelessWidget y retorna MaterialApp para la aplicación.


## Class MyHomePage
Esta clase es para la página principal. Extiene de StatefulWidget.


## Class _MyHomePageState
Contiene el build y define la estructura de la interfaz. 
Dentro está todo el desarollo de la interfaz. El Scaffold, AppBar, Body, las columnas, etc...

### Scaffold
Contiene su estilo como el color de fondo y los componentes de la interfaz.

### AppBar
Contiene el título de la barra, su color de fuente, color de fondo, etc...

### Body
El "mainAxisAlignment: MainAxisAlignment.start" alinea los elementos del body al inicio
Se usa el constructor creado para insertar una imagen y un texto bajo la imagen, desde este 
contenedor se controla el estilo/diseñode las imagenes y textos. Se usa 3 veces este constructor
para las 3 imagenes de las sedes y el nombre de cada una.
También, está el botón el cual tiene el evento de que al ser presionado tiene un método dentro 
que consiste en abrir en la web la página de la Universidad de Los Lagos y si no se puede abrir por 
algún motivo en la consola avisa que no se puede.

### Constructor ConstructorContenedor()
Recibe una ubicación de imagen y un texto para la imagen. Dentro de este constructor se controla
el margen de contenedor, padding, color de fondo del contenedor, etc...
También, se controla el diseño y características de las imagenes y texto, las cuales están ordenadas
en columna.

### Método _launchURL
Tiene la variable con la dirección (URL) de la página web de la Universidad de Los Lagos.
Busca abrir la página, y en caso de no poder genera un mensaje en consola avisando que hay 
un error al abrir la URL.

### Imágenes
Las tres imágenes se encuentran en la carpeta assets.
