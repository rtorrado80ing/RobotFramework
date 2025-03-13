*** Settings ***
Documentation    Practica validacion de Login
Library     SeleniumLibrary

*** Variables ***
${url}=     https://opensource-demo.orangehrmlive.com/
${navegador}=      firefox
${t}=   .1s


*** Test Cases ***
Login uno
    [Documentation]    Prueba uno login datos incorrectos
    [Tags]    login_uno
    open browser    ${url}    ${navegador}
    maximize browser window
    title should be    OrangeHRM
    set selenium implicit wait    10
    set selenium speed    .3s

    #Se valida los dos campos con error si existe el id solo se coloca nombre del id
    input text    name=username   rodrigo
    input text    name=password   123345
    click button    //button[normalize-space()='Login']
    wait until element is visible    //div[@role='alert']
    log to console    Primera validación ok datos erroneos
    wait until page contains    Invalid credentials
    log to console      Menssaje valido = Invalid credentials

    sleep    2
    close browser

Login dos
    [Documentation]    Campo usuario ok nombre mal
    [Tags]    login_dos
    open browser    ${url}    ${navegador}
    maximize browser window
    title should be    OrangeHRM
    set selenium implicit wait    10
    set selenium speed    .3s

    #Se valida los dos campos con error
    input text    name=username   Admin
    input text    name=password   123345
    click button    //button[normalize-space()='Login']
    wait until element is visible    //div[@role='alert']
    log to console    Segunda validación ok datos erroneos
    wait until page contains    Invalid credentials
    log to console      Menssaje valido = Invalid credentials

    sleep    2
    close browser

Login tres
    [Documentation]    Campo password ok usuario erroneo
    [Tags]    login_tres
    open browser    ${url}    ${navegador}
    maximize browser window
    title should be    OrangeHRM
    set selenium implicit wait    10
    set selenium speed    .3s

    #Se valida los dos campos con error
    input text    name=username   rodrigo
    input text    name=password   admin123
    click button    //button[normalize-space()='Login']
    wait until element is visible    //div[@role='alert']
    log to console    Tercera validación ok datos erroneos
    wait until page contains    Invalid credentials
    log to console      Menssaje valido = Invalid credentials

    sleep    2
    close browser


Login cuatro
    [Documentation]    Campo usuario vacio password ok
    [Tags]    login_cuatro
    open browser    ${url}    ${navegador}
    maximize browser window
    title should be    OrangeHRM
    set selenium implicit wait    10
    set selenium speed    .3s
    ${name}=   set variable

    #Se valida los dos campos con error
    input text    name=username     ${name}
    input text    name=password   admin123
    click button    //button[normalize-space()='Login']
    wait until element is visible    //div[@role='alert']
    log to console    Cuarta validación ok datos erroneos
    wait until page contains    Username cannot be empty
    log to console      Menssaje valido = Username cannot be empty

    sleep    2
    close browser

Login cinco
    [Documentation]     Validando user ok  y password vacio
    [Tags]    login_cinco
    open browser    ${url}    ${navegador}
    maximize browser window
    title should be    OrangeHRM
    set selenium implicit wait    10
    set selenium speed      ${t}
    ${user}=    set variable    Admin
    ${pass}=    set variable

    input text    name=username       ${user}
    input text    name=password       ${pass}
    click button    //button[normalize-space()='Login']

    wait until element is visible    //span[@class='oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message']
    log to console    Quinto error encontrado OK
    wait until page contains    Required
    log to console    Error esperado ok = Password Required

    close browser

Login seis
    [Documentation]     Validando user vacio  y password vacio
    [Tags]    login_seis
    open browser    ${url}    ${navegador}
    maximize browser window
    title should be    OrangeHRM
    set selenium implicit wait    10
    set selenium speed      ${t}
    ${user}=    set variable
    ${pass}=    set variable

    input text    name=username       ${user}
    input text    name=password       ${pass}
    click button    //button[normalize-space()='Login']

    wait until element is visible    //div[@class='orangehrm-login-slot-wrapper']//div[1]//div[1]//span[1]
    log to console    Sexto error encontrado OK
    wait until page contains    Required
    log to console    Error esperado ok = Username cannot be empty

    close browser

Login siete
    [Documentation]     Validando "#$% y password correcto
    [Tags]    login_siete
    open browser    ${url}    ${navegador}
    maximize browser window
    title should be    OrangeHRM
    set selenium implicit wait    10
    set selenium speed      ${t}
    ${user}=    set variable    "#$%&/%
    ${pass}=    set variable    admin123

    input text    name=username       ${user}
    input text    name=password       ${pass}
    click button    //button[normalize-space()='Login']

    wait until element is visible    //div[@role='alert']
    log to console    Septimo error encontrado OK
    wait until page contains    Invalid credentials
    log to console    Error esperado ok = Invalid credentials

    close browser

Login ocho
    [Documentation]     Validando user ok y password correcto
    [Tags]    login_ocho
    open browser    ${url}    ${navegador}
    maximize browser window
    title should be    OrangeHRM
    set selenium implicit wait    10
    set selenium speed      ${t}
    ${user}=    set variable    Admin
    ${pass}=    set variable    admin123

    input text    name=username       ${user}
    input text    name=password       ${pass}
    click button    //button[normalize-space()='Login']
    wait until element is visible    //h6[normalize-space()='Dashboard']
    wait until page contains    Dashboard
    log to console    ${\n}Login ocho :: Login Exitoso
    sleep    5

    close browser
*** Keywords ***

