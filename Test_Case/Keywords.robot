*** Settings ***
Documentation    Práctica de uso de Keywords personalizados para automatizar el formulario de DEMOQA.
Library          SeleniumLibrary
Resource         ../Resources/Funciones.robot    # Importa keywords reutilizables

*** Variables ***
# Variables de configuración y datos de entrada
${URL}=             https://demoqa.com/text-box
${NAVEGADOR}=       firefox
${ESPERA}=          0.2
${NOMBRE}=          Rodrigo
${EMAIL}=           rodrigo@gmail.com
${DIRECCION_1}=     Dirección uno
${DIRECCION_2}=     Dirección dos
${IMG_DIR}=         ../Reportes/Img

*** Test Cases ***
Práctica Uno
    [Documentation]     Caso de prueba que automatiza el formulario de DEMOQA utilizando keywords personalizados.
    [Tags]              test_uno
    [Setup]             Cargar Navegador    # Se ejecuta antes del test
    Validar Nombre
    Validar Correo
    Cargar Direcciones
    Enviar Información
    [Teardown]          Cerrar Navegador    # Se ejecuta después del test

*** Keywords ***
Cargar Navegador
    [Documentation]    Abre el navegador, maximiza la ventana y toma una captura inicial de la página.
    Open Browser    ${URL}    ${NAVEGADOR}
    Maximize Browser Window
    Title Should Be    DEMOQA
    F_foto_pagina      inicial.png
    Sleep              ${ESPERA}

Cerrar Navegador
    [Documentation]    Cierra el navegador al finalizar el test.
    Close Browser

Validar Nombre
    [Documentation]    Verifica visibilidad del campo nombre y lo llena con el valor definido.
    Sleep                     ${ESPERA}
    Element Should Be Visible    id=userName
    Log To Console            \nSe ingresa el nombre :: ${NOMBRE}
    Input Text                id=userName    ${NOMBRE}

Validar Correo
    [Documentation]    Llena el campo de correo usando un keyword reutilizable.
    F_texto    id=userEmail    ${EMAIL}

Cargar Direcciones
    [Documentation]    Llena los campos de dirección actual y permanente, y toma capturas.
    Input Text    id=currentAddress     ${DIRECCION_1}
    Sleep         ${ESPERA}
    Log To Console    Cargando dirección :: ${DIRECCION_1}
    Input Text    id=permanentAddress   ${DIRECCION_2}
    F_foto_selector    id=permanentAddress    Direccion2.png
    Sleep         ${ESPERA}
    Execute Javascript    window.scrollTo(0, 200)
    Sleep         ${ESPERA}

Enviar Información
    [Documentation]    Captura pantalla final, oculta anuncio y envía el formulario.
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Sleep                2
    Capture Page Screenshot    ${IMG_DIR}/final.png
    F_foto_pagina              final2.png
    Execute Javascript         document.getElementById("adplus-anchor").style.display = "none";
    Click Button               id=submit
