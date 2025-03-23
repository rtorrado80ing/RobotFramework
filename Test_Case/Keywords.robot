*** Settings ***
Documentation    Practica Keywords
Library     SeleniumLibrary
Resource    ../Resources/Funciones.robot


*** Variables ***
${url}=     https://demoqa.com/text-box
${navegador}=      firefox
${t}=   .2
${name}=    rodrigo
${email}=    rodrigo@gmail.com
${dir1}=    dirección uno

*** Test Cases ***
Practica uno
    [Documentation]     Utlizando los keywords en un Test
    [Tags]    test_uno
    Cargando prueba uno

*** Keywords ***
Cargando el navegador
    open browser    ${url}    ${navegador}
    maximize browser window
    TITLE SHOULD BE    DEMOQA
    F_foto_pagina    inicial.png
    sleep    ${t}

Cerrando el navegador
    close browser

Validar nombre
    sleep    ${t}
    element should be visible    id=userName
    log to console    ${\n}Se ingresa el nombre :: ${name}
    input text    id=userName   ${name}
Validar eMail
#Utilizamos la funcion F_texto    que esta em Funciones
    F_texto    id=userEmail      ${email}
Cargando direcciones
    input text    id=currentAddress     ${dir1}
    sleep    ${t}
    log to console    Cargando direccion :: ${dir1}
    input text    id=permanentAddress   Dirección dos
    capture element screenshot    id=permanentAddress   F:/Documentos/WorkspaceRobotFramework/PyCharm/RobotFramework/Reportes/Img/Direccion2.png
    sleep    ${t}
    execute javascript      window.scrollTo(0,200)
    sleep    ${t}
Enviar informacion
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2
    capture page screenshot    F:/Documentos/WorkspaceRobotFramework/PyCharm/RobotFramework/Reportes/Img/final.png
    F_foto_pagina    final2.png


    Execute Javascript    document.getElementById("adplus-anchor").style.display = "none";
    Click Button    id=submit


Cargando prueba uno
    Cargando el navegador
    Validar nombre
    Validar eMail
    Cargando direcciones
    Enviar informacion
    Cerrando el navegador