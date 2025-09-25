# Proyecto: practicaUnoFlutter (Flutter)

## 📝 Descripción Detallada del Proyecto

**practicaUnoFlutter** es la versión multiplataforma del proyecto `practicaUno`, desarrollada con el framework Flutter y el lenguaje Dart. Su objetivo es replicar la funcionalidad del catálogo interactivo de componentes de UI, demostrando cómo se construyen interfaces y se maneja el estado en un entorno declarativo.

La aplicación está organizada en dos "pantallas" principales, que en Flutter son simplemente widgets (`Scaffold`), cada una con su propia barra de navegación inferior y su conjunto de "páginas" (widgets de contenido).

1.  **`MainScreen`**: La pantalla de inicio, que contiene 3 páginas intercambiables:
    * **Textos**: Demuestra el uso de `TextField`.
    * **Botones**: Muestra `ElevatedButton` y `IconButton`.
    * **Selección**: Presenta `Checkbox`, `Switch` y `Radio`.
    * Incluye un botón principal para navegar a la segunda pantalla.

2.  **`SecondScreen`**: Una pantalla secundaria para componentes más complejos.
    * **Listas**: Implementa un `ListView.builder`, el equivalente eficiente de `RecyclerView`.
    * **Info**: Contiene widgets como `Image` y `LinearProgressIndicator`.
    * La navegación de regreso se gestiona automáticamente por el `AppBar` de Flutter, aunque también se añadió un botón explícito para demostrar el uso de `Navigator.pop()`.

El proyecto destaca el paradigma de "UI como código" de Flutter, la gestión de estado a través de `StatefulWidget` y `setState`, y el sistema de navegación por rutas.

---

## 🚀 Instrucciones de Ejecución y Pruebas

Sigue estos pasos para ejecutar la aplicación en tu entorno de desarrollo.

### **Pre-requisitos**
* **Flutter SDK**: Versión 3.0 o superior. (Verifica con `flutter --version`).
* **IDE**: Visual Studio Code (con la extensión de Flutter) o Android Studio (con el plugin de Flutter).
* Un emulador de Android/iOS o un dispositivo físico.

### **Pasos para la Ejecución**
1.  **Clonar el Repositorio**:
    ```sh
    git clone <URL_DEL_REPOSITORIO>
    ```
2.  **Navegar al Directorio**:
    ```sh
    cd practicaunoflutter
    ```
3.  **Obtener Dependencias**:
    ```sh
    flutter pub get
    ```
4.  **Seleccionar Dispositivo**: Asegúrate de que tu IDE o la línea de comandos detecte un dispositivo (`flutter devices`).
5.  **Ejecutar la App**:
    * Desde la terminal, ejecuta: `flutter run`
    * O, desde tu IDE, presiona el botón de "Run" o "Debug".

---

## 📸 Capturas de Pantalla

A continuación, se muestran capturas que demuestran la interfaz y funcionalidades de la aplicación en Flutter.

| Pantalla Principal (MainScreen) | Demostración de Texto | Pantalla Avanzada (SecondScreen) |
| :---------------------------------: | :---------------------------: | :----------------------------------: |
| ![Pantalla principal con 3 tabs y botón de navegación](https://github.com/KYaelDLRG/practicaUno/blob/master/photo_4_2025-09-25_05-04-35.jpg) | ![Página de texto interactiva](https://github.com/KYaelDLRG/practicaUno/blob/master/photo_5_2025-09-25_05-04-35.jpg) | ![Pantalla de listas y barra de regreso automática](https://github.com/KYaelDLRG/practicaUno/blob/master/photo_1_2025-09-25_05-04-35.jpg) |

*(Nota: Debes reemplazar `ruta/a/flutter_screenshot.png` con la ubicación real de tus capturas de pantalla para que se visualicen).*

---

## 🧐 Dificultades y Soluciones

El desarrollo en Flutter presentó un conjunto diferente de desafíos en comparación con el nativo.

### **Dificultad 1: Preservar el Estado al Cambiar de Tab en la Navegación Inferior**
* **Problema**: Inicialmente, cada vez que se cambiaba de tab (por ejemplo, de "Textos" a "Botones" y de vuelta), el estado de la página anterior se perdía (el texto escrito en el `TextField` desaparecía). Esto se debe a que, por defecto, el widget anterior se eliminaba del árbol de widgets.
* **Solución**: La solución fue utilizar el widget `IndexedStack`. En lugar de reconstruir el widget de la página seleccionada cada vez, `IndexedStack` mantiene a todos sus hijos en el árbol de widgets y simplemente muestra el que corresponde al índice actual. Esto preserva el estado de cada página de manera eficiente y sin necesidad de gestores de estado complejos para este caso de uso.

### **Dificultad 2: Entender el Flujo de Navegación "Declarativo"**
* **Problema**: Acostumbrado al modelo de `Intents` y `Activities` de Android, el sistema de `Navigator` de Flutter (con `push` y `pop`) parecía menos explícito al principio. No estaba claro cómo manejar el regreso desde la `SecondScreen`.
* **Solución**: El aprendizaje clave fue que `Navigator.push` apila una nueva "ruta" (pantalla) sobre la anterior. El `AppBar` de Flutter detecta automáticamente que puede "regresar" y añade la flecha de "Atrás". Su funcionalidad es equivalente a llamar `Navigator.pop(context)`, que simplemente quita la ruta actual de la pila, revelando la anterior. Se añadió un botón explícito con `Navigator.pop()` para reforzar este concepto.

---

## 💡 Hallazgos

* **Desarrollo Rápido con UI Declarativa**: La capacidad de construir la interfaz directamente en Dart, junto con la función de "Hot Reload", acelera drásticamente el ciclo de desarrollo y experimentación. La estructura del código de UI es más intuitiva y directa que la combinación de XML y Kotlin.
* **La Gestión de Estado es Central**: A diferencia de Android, donde el estado a menudo está ligado al ciclo de vida de los componentes, en Flutter la gestión del estado es una decisión de diseño fundamental desde el principio. `setState` es suficiente para widgets locales, pero `IndexedStack` fue clave para el estado de la UI a nivel de pantalla.
* **Composición sobre Herencia**: Flutter favorece la composición: widgets complejos se construyen a partir de widgets más simples. Esto hace que el código sea altamente reutilizable. Las "páginas" de contenido (`button_page.dart`, etc.) son widgets completamente independientes que podrían ser colocados en cualquier otra parte de la aplicación sin cambios.
