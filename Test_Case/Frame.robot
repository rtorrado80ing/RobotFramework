# Ejecucion robot Test_Case/Test_uno.robot
# Ejecucion para crear carpeta de reporte en la raiz robot -d Nombrecarpeta Test_Case/V*.robot
# Ejecutar por Tag especifico robot -d Nombrecarpeta -i nombreTag Test_Case/V*.robot

*** Settings ***
Documentation   Proyecto de pruebas para proyecto
Library  SeleniumLibrary

*** Variables ***
${url}  https://testpages.eviltester.com/styled/frames/frames-test.html
${navegador}   firefox


*** Test Cases ***
Mi octavo Test
    [Documentation]     Obtava prueba de alertas
    [Tags]    test_frame
    Log    ${url} ${navegador}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    #Debes esperar hasta .5 segundos
    set selenium speed    .8s
    select frame    name=top
    #validando un texto en la pagina
    wait until page contains    Nested Frames Example
    unselect frame

    select frame    name=left
    click element    //li[@id='left1']
    unselect frame


    Close Browser



*** Keywords ***
