*** Settings ***
Documentation    Demo de las Variables
Library     SeleniumLibrary

*** Variables ***
${url}=     https://demoqa.com/text-box
${navegador}=      chrome



*** Test Cases ***
Demo uno
    [Documentation]     Prueba de nuestras Primeras Variables
    [Tags]    test_uno
    open browser    ${url}    ${navegador}
    maximize browser window
    title should be    ToolsQA
    set selenium implicit wait    10
    set selenium speed    .1s

    sleep    2
    close browser

*** Keywords ***
