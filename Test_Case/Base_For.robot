*** Settings ***
Documentation    Demo de las Variables
Library     SeleniumLibrary
Library    String
Resource    ../Resources/Funciones.robot    # Importa keywords reutilizables

*** Variables ***
${url}=     https://demoqa.com/text-box
${navegador}=      chrome


@{ROBOTS}=      Bender      Reminator       Robocob     RobotFramework
@{num}=         1   2   3   4   5   6   7   8   9   10

*** Test Cases ***
Demo uno
    [Documentation]     Prueba For
    [Tags]    test_uno
    open browser    ${url}    ${navegador}
    maximize browser window
    title should be    DEMOQA
    set selenium implicit wait    10
    set selenium speed    .1s

    FOR    ${i}     IN RANGE    0       5
        LOG TO CONSOLE    ${1}
        open browser    ${url}      ${navegador}
        maximize browser window
    END

    FOR    ${items}  IN    @{ROBOTS}
        Exit For Loop If    $items=='RobotFramework'
        log to console    ${items}
        ${numbers}=     Generate random string  5       0123456789123
        log to console     ${numbers}
    END


    sleep    2
    close all browsers

*** Keywords ***
