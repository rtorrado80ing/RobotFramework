*** Settings ***
Documentation    Practica Keywords
Library     SeleniumLibrary

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
    sleep    ${t}

Cerrando el navegador
    close browser

Validar nombre
    sleep    ${t}
    element should be visible    id=userName
    log to console    ${\n}Se ingresa el nombre :: ${name}
    input text    id=userName   ${name}
Validar eMail
    element should be visible    id=userEmail
    log to console    Se ingresa el eMail :: ${email}
    input text    id=userEmail      ${email}
Cargando direcciones
    input text    id=currentAddress     ${dir1}
    sleep    ${t}
    log to console    Cargando direccion :: ${dir1}
    input text    id=permanentAddress   Dirección dos
    sleep    ${t}
    execute javascript      window.scrollTo(0,200)
    sleep    ${t}
Enviar informacion
    click button    id=submit
Cargando prueba uno
    Cargando el navegador
    Validar nombre
    Validar eMail
    Cargando direcciones
    Enviar informacion
    Cerrando el navegador