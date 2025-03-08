# Ejecucion robot Test_Case/Test_uno.robot
# Ejecucion para crear carpeta de reporte en la raiz robot -d Nombrecarpeta Test_Case/V*.robot
# Ejecutar por Tag especifico robot -d Nombrecarpeta -i nombreTag Test_Case/V*.robot

*** Settings ***
Documentation   Proyecto de pruebas para proyecto
Library  SeleniumLibrary

*** Variables ***
${url}  https://testpages.eviltester.com/styled/basic-html-form-test.html
${navegador}   firefox
${time}    .5

*** Test Cases ***
Mi octavo Test
    [Documentation]     Obtava prueba de validacion de radio button
    [Tags]    test_radio_button
    Log    ${url} ${navegador}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    Sleep    ${time}
    title should be     HTML Form Elements
    Sleep    ${time}
    select radio button    radioval    rd1
    Sleep    ${time}
    Close Browser

Mi noveno Test
    [Documentation]     Novena prueba de validacion de check box
    [Tags]    test_check_box
    Log    ${url} ${navegador}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    Sleep    ${time}
    title should be    HTML Form Elements
    Sleep    ${time}
    select checkbox    checkboxes[]
    Sleep    ${time}
    click button    //input[@value='cb2']
    Sleep    ${time}
    Close Browser

Mi decimo Test
    [Documentation]     Decima prueba de validacion de slectores
    [Tags]    test_select
    Log    ${url} ${navegador}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    Sleep    ${time}
    title should be    HTML Form Elements
    Sleep    ${time}
    Execute Javascript    window.scrollTo(0, 300)
    select from list by label    dropdown   Drop Down Item 1
    Sleep    ${time}
    #Segundo modulo    multiple select
    select from list by index    multipleselect[]   1
    Sleep    ${time}
    select from list by index    multipleselect[]   2
    Sleep    ${time}
    select from list by value    multipleselect[]   ms3
    Sleep    ${time}


    Close Browser
*** Keywords ***
