*** Settings ***
# ------------------------------------------------------------------
# Configuración del entorno de prueba y recursos externos
# ------------------------------------------------------------------
Documentation    Práctica de uso de Keywords personalizados para automatizar el formulario de DEMOQA.
Library          SeleniumLibrary    # Librería para automatización web con Selenium
Resource         ../Resources/Funciones.robot    # Importa keywords reutilizables definidos en Funciones.robot

*** Variables ***
# ------------------------------------------------------------------
# Variables de configuración y datos de entrada
# ------------------------------------------------------------------
${URL}=             https://demoqa.com/text-box    # URL de la página a probar
${NAVEGADOR}=       firefox                        # Navegador utilizado para la ejecución
${ESPERA}=          0.2                            # Tiempo de espera entre pasos
${NOMBRE}=          Rodrigo                        # Nombre a ingresar en el formulario
${EMAIL}=           rodrigo@gmail.com              # Email a ingresar en el formulario
${DIRECCION_1}=     Dirección uno                  # Dirección actual
${DIRECCION_2}=     Dirección dos                  # Dirección permanente
${IMG_DIR}=         ../Reportes/Img                # Ruta para almacenar capturas de pantalla

*** Test Cases ***
# ------------------------------------------------------------------
# Caso de prueba principal: Automatización del formulario de DEMOQA
# ------------------------------------------------------------------
Práctica Uno
    [Documentation]     Caso de prueba que automatiza el formulario de DEMOQA utilizando keywords personalizados.
    [Tags]              test_uno
    [Setup]             Cargar Navegador    # Se ejecuta antes del inicio del test
    Validar Nombre       # Ingreso del nombre en el campo correspondiente
    Validar Correo       # Ingreso del email en el campo correspondiente
    Cargar Direcciones   # Ingreso de direcciones actuales y permanentes
    Enviar Información   # Enviar el formulario y capturar pantalla final
    [Teardown]          Cerrar Navegador    # Se ejecuta al finalizar el test

*** Keywords ***
# ------------------------------------------------------------------
# Keyword: Cargar Navegador
# Descripción: Abre el navegador, maximiza la ventana y toma una captura inicial.
# ------------------------------------------------------------------
Cargar Navegador
    [Documentation]    Abre el navegador, maximiza la ventana y toma una captura inicial de la página.
    Open Browser    ${URL}    ${NAVEGADOR}
    Maximize Browser Window    # Maximiza la ventana del navegador
    Title Should Be    DEMOQA  # Verifica que el título de la página sea el esperado
    F_foto_pagina      inicial.png  # Captura de pantalla inicial
    Sleep              ${ESPERA}    # Pausa para asegurar la carga completa

# ------------------------------------------------------------------
# Keyword: Cerrar Navegador
# Descripción: Cierra el navegador al finalizar el test.
# ------------------------------------------------------------------
Cerrar Navegador
    [Documentation]    Cierra el navegador al finalizar el test.
    Close Browser

# ------------------------------------------------------------------
# Keyword: Validar Nombre
# Descripción: Verifica la visibilidad del campo 'Nombre' y lo completa con el dato ingresado.
# ------------------------------------------------------------------
Validar Nombre
    [Documentation]    Verifica visibilidad del campo nombre y lo llena con el valor definido.
    Sleep                     ${ESPERA}
    Element Should Be Visible    id=userName   # Verifica que el campo sea visible
    Log To Console            \nSe ingresa el nombre :: ${NOMBRE}
    Input Text                id=userName    ${NOMBRE}  # Ingresa el nombre en el campo

# ------------------------------------------------------------------
# Keyword: Validar Correo
# Descripción: Ingresa el email en el campo correspondiente.
# ------------------------------------------------------------------
Validar Correo
    [Documentation]    Llena el campo de correo usando un keyword reutilizable.
    F_texto    id=userEmail    ${EMAIL}  # Llama al keyword definido en Funciones.robot

# ------------------------------------------------------------------
# Keyword: Cargar Direcciones
# Descripción: Ingresa las direcciones actual y permanente, y toma capturas.
# ------------------------------------------------------------------
Cargar Direcciones
    [Documentation]    Llena los campos de dirección actual y permanente, y toma capturas.
    Input Text    id=currentAddress     ${DIRECCION_1}
    Sleep         ${ESPERA}
    Log To Console    Cargando dirección actual :: ${DIRECCION_1}
    Input Text    id=permanentAddress   ${DIRECCION_2}
    F_foto_selector    id=permanentAddress    Direccion2.png  # Captura del campo de dirección permanente
    Sleep         ${ESPERA}
    Execute Javascript    window.scrollTo(0, 200)  # Realiza scroll hacia abajo
    Sleep         ${ESPERA}

# ------------------------------------------------------------------
# Keyword: Enviar Información
# Descripción: Captura pantalla final, oculta anuncio flotante y envía el formulario.
# ------------------------------------------------------------------
Enviar Información
    [Documentation]    Captura pantalla final, oculta anuncio y envía el formulario.
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)  # Scroll al final de la página
    Sleep                2
    Capture Page Screenshot    ${IMG_DIR}/final.png  # Captura de pantalla final
    F_foto_pagina              final2.png
    Execute Javascript         document.getElementById("adplus-anchor").style.display = "none";  # Oculta anuncio flotante
    Click Button               id=submit  # Envía el formulario
