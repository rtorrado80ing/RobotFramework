# Ejecucion robot Test_Case/Test_uno.robot
# Ejecucion para crear carpeta de reporte en la raiz robot -d Nombrecarpeta Test_Case/V*.robot
# Ejecutar por Tag especifico robot -d Nombrecarpeta -i nombreTag Test_Case/V*.robot

*** Settings ***
Documentation   Proyecto de pruebas para proyecto
Library  SeleniumLibrary

*** Variables ***
${url}  https://demoqa.com/
${navegador}   firefox


*** Test Cases ***
Mi primer Test
    [Documentation]     switch browser
    [Tags]    test_uno
    Log    ${url} ${navegador}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    #Debes esperar hasta .5 segundos
    set selenium speed    .8s

    Open Browser    https://testpages.eviltester.com/styled/index.html    ${navegador}
    maximize browser window

    switch browser    1
    ${titulo}=  get title
    log to console    ${\n}Titulo de la pagina 1 :: ${titulo}

    switch browser    2
    ${titulo}=  get title
    log to console    ${\n}Titulo de la pagina 2 :: ${titulo}


    Close All Browsers

Mi segundo Test
    [Documentation]     switch browser go to
    [Tags]    test_dos
    Log    ${url} ${navegador}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    #Debes esperar hasta .5 segundos
    set selenium speed    .8s
    ${titulo1}=  get title
    log to console    ${\n}Titulo de la pagina 1 :: ${titulo1}

    go to    https://testpages.eviltester.com/styled/index.html
    maximize browser window
    ${titulo2}=  get title
    log to console    ${\n}Titulo de la pagina 2 :: ${titulo2}
    sleep    3
    log to console    ${\n}Regresando pagina 1 :: ${titulo1}
    go back
    sleep    3


    Close All Browsers


*** Keywords ***
