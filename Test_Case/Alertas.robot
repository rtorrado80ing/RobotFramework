# Ejecucion robot Test_Case/Test_uno.robot
# Ejecucion para crear carpeta de reporte en la raiz robot -d Nombrecarpeta Test_Case/V*.robot
# Ejecutar por Tag especifico robot -d Nombrecarpeta -i nombreTag Test_Case/V*.robot

*** Settings ***
Documentation   Proyecto de pruebas para proyecto
Library  SeleniumLibrary

*** Variables ***
${url}  https://testpages.eviltester.com/styled/alerts/alert-test.html
${navegador}   firefox


*** Test Cases ***
Mi octavo Test
    [Documentation]     Obtava prueba de alertas
    [Tags]    test_handle_alert
    Log    ${url} ${navegador}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    #Debes esperar hasta .5 segundos
    set selenium speed    .8s
    #validando un texto en la pagina
    wait until page contains    Alert Box Examples
    #Validando el titulo de la pagina
    title should be     Test Page For JavaScript Alerts
    wait until element is visible    //input[@id='alertexamples']
    click button    id=alertexamples
    handle alert    accept

    click button    //input[@id='confirmexample']
    handle alert    accept

    click button    //input[@id='confirmexample']
    handle alert    dismiss

    click button    id=alertexamples
    alert should be present    I am an alert box!

    Close Browser



*** Keywords ***
