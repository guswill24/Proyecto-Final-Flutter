# Entrega Proyecto Final

## Estudiante: Gustavo Willyn Sánchez Rodríguez

### Descripción (Elegir una app)

**Descripción:** La App desarrollada corresponde a un manejador de música de diferentes artistas, los cuales se encuentran almacenados en una base de datos local SQLite y los recursos de imágenes y archivos mp3 se encuentran ubicados en los assets del proyecto.

### Descripción (Creación de la UI)

El diseño de la app se ha elaborado en Figma, la herramienta para diseño de aplicaciones web y móviles. La app consta de 6 páginas en las cuales se ha trazado el mapa de navegación en Figma para apoyarse en todo el proceso de desarrollo. La relación de páginas es la siguiente:

| No. | Página       | Descripción                                                  |
|-----|--------------|--------------------------------------------------------------|
| 1   | Inicio       | Página de arranque del App, con temporizador de 5 segundos. |
| 2   | Login        | Página de verificación de usuarios y contraseña.             |
| 3   | Home         | Página de aterrizaje del sitio.                              |
| 4   | Music        | Página para consultar artistas y canciones.                  |
| 5   | Play Music   | Página con descripción del audio de la canción.              |
| 6   | Créditos     | Página con datos del desarrollador del app.                  |
| 7   | main.dart    | Página de control de navegación del sitio.                    |

La información se consulta desde una base de datos trabajada en SQLite, la cual se utiliza en las páginas de Music y Play Music.

**Link Figma:** [Prototipo Music App - Final](https://www.figma.com/design/TTANfAhxdnmtdCBATSq9H1/Prototipo-Music-App---Final?node-id=0%3A1&t=vOeHH6xvwqrfTRWx-1)

### Descripción (Almacenamiento)

Para el almacenamiento, opté por utilizar la base de datos SQLite y diseñé una única tabla para administrar las canciones. Debido a restricciones de tiempo, no implementé una tabla adicional para gestionar la autenticación de usuarios mediante nombre de usuario y contraseña. Originalmente, tenía la intención de abordar esta funcionalidad utilizando Firebase, aprovechando sus servicios para un acceso seguro. Sin embargo, dado el cronograma ajustado, he decidido posponer esta parte y considerar la posibilidad de abordarla en el futuro, tal vez adquiriendo el bootcamp avanzado de Flutter que ofrece codigofacilito.

También incorporé el uso de Provider para gestionar el estado de la aplicación. Inicialmente, todo estaba implementado en StatefulWidgets y no tenía una comprensión clara de esta área. Sin embargo, gracias a la explicación de codigofacilito y después de dedicar varias horas a ajustar la lógica de todo el proceso, logré encapsular esta funcionalidad de manera efectiva. Ahora, con el estado global gestionado por Provider, el código se vuelve más legible y accesible desde cualquier parte de la aplicación.

Decidí incluir un botón con un icono de base de datos para observar cómo, al eliminar todas las canciones y actualizar la información, esta se refresca en todos los widgets. Este proceso resultó muy interesante de observar y brindó una comprensión más profunda del flujo de datos en la aplicación.

### Interfaces del aplicativo

[Imagen de las interfaces]

### Herramientas usadas para el desarrollo

- **Fondo:** [Blue Techno Background](https://www.freepik.com/free-vector/blue-techno-background_762028.htm#query=music%20background&position=17&from_view=keyword&track=ais_user&uuid=01ceed0a-0b9c-4ea1-bb76-32b12fb77ae6#position=17&query=music%20background)
- **Logotipo:** [Canva](https://www.canva.com/design/DAGFnYIQhz4/pVesY6VKg--TUfJMygdjSw/edit)
- **Fuentes:** [FontAwesome](https://fontawesome.com/)
- **Descargar Fuentes:** [DaFont](https://www.dafont.com/es/gistesy.font)
- **Youtube Artistas:** [TimeMusic](https://www.youtube.com/@timemusic.us999)
- **Adobe Photoshop**
- **Adobe Illustrator**