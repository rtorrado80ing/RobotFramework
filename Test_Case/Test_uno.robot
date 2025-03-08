# Ejecucion robot Test_Case/Test_uno.robot
# Ejecucion para crear carpeta de reporte en la raiz robot -d Nombrecarpeta Test_Case/Test_uno.robot

*** Settings ***
Documentation   Proyecto de pruebas para proyecto
Library  SeleniumLibrary

*** Variables ***
${url}  https://demoqa.com/text-box
${navegador}   firefox
${nombre}   Rodrigo
${apellido}     Prueba
${email}    rodrigo@gmail.com
${currentAddress}   direccion uno
${permanentAddress}     direccion dos

*** Test Cases ***
Mi primer Test
    [Documentation]     Primera prueba del sistema en firefox
    [Tags]    test_firefox
    Open Browser    https://demoqa.com/text-box    ${navegador}
    Maximize Browser Window
    Sleep    2
    Input Text    id=userName   Rodrigo
    Input Text    id=userEmail  rodrigo@gmail.com
    Input Text    id=currentAddress    direccion uno
    Execute Javascript    window.scrollTo(0, 300)
    Sleep    2
    Input Text    id=permanentAddress  direccion dos
    Click Button    id=submit
    Sleep    5
    Close Browser
Mi segundo Test
    [Documentation]     Segunda prueba del sistema en crhome
    [Tags]    test_chrome
    Open Browser    https://demoqa.com/text-box    chrome
    Maximize Browser Window
    Sleep    2
    Input Text    id=userName   Rodrigo
    Input Text    id=userEmail  rodrigo@gmail.com
    Input Text    id=currentAddress    direccion uno
    Execute Javascript    window.scrollTo(0, 300)
    Sleep    2
    Input Text    id=permanentAddress  direccion dos
    Click Button    id=submit
    Sleep    5
    Close Browser

Mi tercer Test
    [Documentation]     Tercera prueba del sistema con variables
    [Tags]    test_variables
    Log    ${url} ${navegador} ${nombre} ${apellido} ${email} ${currentAddress} ${permanentAddress}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    Sleep    2
    Input Text    id=userName   ${nombre} ${apellido}
    Input Text    id=userEmail  ${email}
    Input Text    id=currentAddress    ${currentAddress}
    Execute Javascript    window.scrollTo(0, 300)
    Sleep    2
    Input Text    id=permanentAddress  ${permanentAddress}
    Click Button    id=submit
    Sleep    5
    Close Browser


Mi cuarto Test
    [Documentation]    Cuarta Prueba variables locales
    [Tags]    test_variables_locales
    ${a} =  set variable    20
    ${b} =  set variable    30
    ${c} =  evaluate    ${a}+${b}

    log to console    ${c}

Mi quinto test
    [Documentation]    Validando el titulo de la pagina
    [Tags]  test_titulo
    Log    ${url} ${navegador} ${nombre} ${apellido} ${email} ${currentAddress} ${permanentAddress}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    Sleep    2
    title should be    DEMOQA
    sleep    1
    Close Browser

*** Keywords ***