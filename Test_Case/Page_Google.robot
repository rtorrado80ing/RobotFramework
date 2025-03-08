*** Settings ***
Library  SeleniumLibrary

Suite Setup       Abrir Navegador
Suite Teardown    Cerrar Navegador

*** Variables ***
${URL}           http://www.google.com/
${BROWSER}       Chrome
${SEARCH_BOX}    name:q
${ENTER_KEY}     \ue007
${SEARCH_TERM}   nintendo

*** Test Cases ***
Buscar Nintendo En Google
    Buscar En Google    ${SEARCH_TERM}
    Verificar Resultado    Nintendo

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${SEARCH_BOX}    10s

Cerrar Navegador
    Close Browser

Buscar En Google
    [Arguments]    ${texto}
    Input Text    ${SEARCH_BOX}    ${texto}
    Press Key    ${SEARCH_BOX}    ${ENTER_KEY}
    Wait Until Page Contains    ${texto}    10s

Verificar Resultado
    [Arguments]    ${texto}
    Wait Until Page Contains    ${texto}    10s
