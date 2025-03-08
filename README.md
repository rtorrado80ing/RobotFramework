# 🏆 Proyecto de Automatización con Robot Framework 🚀

Este proyecto utiliza **Robot Framework** y **SeleniumLibrary** para automatizar pruebas funcionales en aplicaciones web.

## 📌 Requisitos Previos

Antes de ejecutar las pruebas, asegúrate de tener instalado:

- [Python](https://www.python.org/) (versión 3.7 o superior)
- [pip](https://pip.pypa.io/en/stable/)
- [Google Chrome](https://www.google.com/chrome/) o [Mozilla Firefox](https://www.mozilla.org/)
- [Chromedriver](https://chromedriver.chromium.org/downloads) o [Geckodriver](https://github.com/mozilla/geckodriver/releases)

## 📝 Instalación

Clona el repositorio y luego instala las dependencias:

```sh
git clone https://github.com/rtorrado80ing/RobotFramework.git
cd tu_repositorio
pip install -r requirements.txt

${EXECDIR}=/repo/testdata/execution
%{WORKSPACE}=/home/workspace
```

Si `requirements.txt` no está disponible, instala manualmente:

```sh
pip install robotframework robotframework-seleniumlibrary
```

## 🚀 Ejecución de Pruebas

Para ejecutar todas las pruebas, usa el siguiente comando:

```sh
robot -d results tests/
```

Ejecutar un caso de prueba específico:

```sh
robot -d results tests/test_google.robot
```

📌 **Opciones útiles:**
- `-d results` → Guarda los reportes en la carpeta `results`.
- `-i etiqueta` → Ejecuta solo pruebas con una etiqueta específica.
- `-v variable:value` → Define variables en tiempo de ejecución.

## 💂️‍♂️ Estructura del Proyecto

```
📦 tu_proyecto/
️🐟 tests/            # Casos de prueba en Robot Framework
️   🐟 test_google.robot
️   🐟 test_login.robot
️🐟 resources/        # Keywords y variables reutilizables
️   🐟 google_keywords.robot
️   🐟 login_keywords.robot
️🐟 results/          # Reportes de ejecución
️🐟 requirements.txt  # Dependencias del proyecto
️🐟 README.md         # Documentación del proyecto
```

## 📊 Reportes y Logs

Después de ejecutar las pruebas, revisa los resultados generados en la carpeta `results/`:

- 📄 **Output:** `output.xml`
- 📊 **Reporte:** `report.html`
- 📝 **Log:** `log.html`

Para visualizar los reportes en el navegador:

```sh
start results/report.html
```

## 📌 Contribuir

¡Las contribuciones son bienvenidas! Para colaborar:

1. **Haz un fork** del repositorio.
2. **Crea una nueva rama** (`git checkout -b feature-nueva-funcionalidad`).
3. **Realiza tus cambios y haz un commit** (`git commit -m "Agrega nueva funcionalidad"`).
4. **Envía un pull request** 🚀.

---

### 💡 Autor
📌 _Ricardo Torrado_  
📌 _[Tu GitHub](https://github.com/rtorrado80ing)_  

---

🎯 **¡Gracias por usar este proyecto!** Si te resultó útil, dale una ⭐ en GitHub.
