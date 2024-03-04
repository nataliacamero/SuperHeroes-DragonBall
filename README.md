# SuperHerosDragonBall

Este proyecto implementa una aplicación iOS que muestra información sobre héroes del universo Dragon Ball. Los usuarios pueden iniciar sesión, ver una lista de héroes disponibles y explorar las transformaciones de cada héroe.

## Tecnologías Utilizadas

- **UIKit**: Utilizada para crear la interfaz de usuario de la aplicación.
- **Xcode**: IDE utilizado para el desarrollo de la aplicación, diseño de la interfaz del usuario mediante **archivos XIB**.
- **Conexión con API externa**: La aplicación se conecta a una API externa para obtener datos sobre los héroes y sus transformaciones.
- **MVC (Modelo-Vista-Controlador)**: Patrón de diseño utilizado para organizar y estructurar el código de la aplicación.

## Componentes del Proyecto

El proyecto consta de varios componentes principales:

1. **LoginViewController**: Controlador de vista responsable de manejar el inicio de sesión de los usuarios. Los usuarios deben ingresar un nombre de usuario y contraseña para acceder a la aplicación.

2. **TableViewController**: Controlador de vista que muestra una lista de héroes disponibles. Cada héroe se muestra en una celda de tabla, y los usuarios pueden hacer clic en una celda para ver más detalles sobre el héroe seleccionado.

3. **DataViewController**: Controlador de vista que muestra información detallada sobre un héroe específico. Muestra la imagen, nombre y descripción del héroe, así como sus transformaciones disponibles.

4. **HeroesTableViewCell**: Celda de tabla personalizada utilizada para mostrar la información básica de un héroe en la vista de lista de héroes.

5. **TransformationsListViewController**: Controlador de vista que muestra una lista de transformaciones disponibles para un héroe específico. Si no hay transformaciones disponibles para un héroe, se muestra un mensaje indicando que no hay datos disponibles.

6. **TransformationsTableViewCell**: Celda de tabla personalizada utilizada para mostrar información detallada sobre una transformación específica en la vista de lista de transformaciones.

7. **NetworkModel**: Clase responsable de gestionar las solicitudes de red, incluido el inicio de sesión, la obtención de héroes y la obtención de transformaciones. Utiliza URLSession para realizar solicitudes HTTP a la API externa.

## Arquitectura MVC

El proyecto sigue una arquitectura Modelo-Vista-Controlador (MVC) para separar la lógica de presentación de la lógica de negocio y los datos. Aquí está cómo se organiza el código en cada componente:

- **Modelo (Model)**: Representado por la clase `NetworkModel`, que maneja las solicitudes de red y la manipulación de datos.

- **Vista (View)**: Representado por las interfaces de usuario (storyboards, xibs) y las clases de vista (`LoginViewController`, `TableViewController`, `DataViewController`, `HeroesTableViewCell`, `TransformationsListViewController`, `TransformationsTableViewCell`). Las vistas son responsables de presentar la interfaz de usuario y responder a las interacciones del usuario.

- **Controlador (Controller)**: Representado por las clases controladoras (`LoginViewController`, `TableViewController`, `DataViewController`, `TransformationsListViewController`). Los controladores actúan como intermediarios entre el modelo y la vista, manejan la lógica de presentación y coordinan las interacciones del usuario.

## Cómo Ejecutar el Proyecto

Para ejecutar este proyecto, sigue estos pasos:

1. Clona el repositorio desde GitHub.
2. Abre el proyecto en Xcode.
3. Compila y ejecuta la aplicación en el simulador de iOS o en un dispositivo físico.

## Notas Adicionales

- Asegúrate de tener una conexión a internet activa para acceder a los datos de la API externa.
- La aplicación utiliza una conexión segura (HTTPS) para comunicarse con el servidor.

¡Disfruta explorando el universo de Dragon Ball con SuperHerosDragonBall! 🐉✨

