# Ejecucion robot Test_Case/Test_uno.robot
# Ejecucion para crear carpeta de reporte en la raiz robot -d Nombrecarpeta Test_Case/V*.robot
# Ejecutar por Tag especifico robot -d Nombrecarpeta -i nombreTag Test_Case/V*.robot

*** Settings ***
Documentation   Proyecto de pruebas para proyecto
Library  SeleniumLibrary

*** Variables ***
${url}  https://testpages.eviltester.com/styled/basic-html-form-test.html
${navegador}   firefox


*** Test Cases ***
Mi octavo Test
    [Documentation]     Obtava prueba de validacion de radio button
    [Tags]    test_radio_button
    Log    ${url} ${navegador}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    #Debes esperar hasta .5 segundos
    set selenium speed    .5s
    title should be     HTML Form Elements
    select radio button    radioval    rd1
    Close Browser

Mi noveno Test
    [Documentation]     Novena prueba de validacion de check box
    [Tags]    test_check_box
    Log    ${url} ${navegador}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    #Funcion para la espera de los elementos
    ${tiempo}   get selenium timeout
    log to console    ${tiempo}
    #Espera hasta 15 segundos
    set selenium timeout    15
    title should be    HTML Form Elements
    select checkbox    checkboxes[]
    click button    //input[@value='cb2']
    Close Browser
    
Mi decimo Test
    [Documentation]     Decima prueba de validacion de slectores
    [Tags]    test_select
    Log    ${url} ${navegador}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    ${tiempo}   get selenium implicit wait
    log to console    ${tiempo}
    #Tienes hasta el tiempo que selecciones para esperar el elemento
    set selenium implicit wait    30
    title should be    HTML Form Elements
    Execute Javascript    window.scrollTo(0, 300)
    select from list by label    dropdown   Drop Down Item 1
    #Segundo modulo    multiple select
    select from list by index    multipleselect[]   1
    select from list by index    multipleselect[]   2
    select from list by value    multipleselect[]   ms3
    Close Browser

*** Keywords ***
