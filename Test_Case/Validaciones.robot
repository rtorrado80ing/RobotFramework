# Ejecucion robot Test_Case/Test_uno.robot
# Ejecucion para crear carpeta de reporte en la raiz robot -d Nombrecarpeta Test_Case/V*.robot
# Ejecutar por Tag especifico robot -d Nombrecarpeta -i nombreTag Test_Case/V*.robot

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
${time}    .5

*** Test Cases ***
Mi sexto Test
    [Documentation]     Sexta prueba de validacion de campos visibles
    [Tags]    test_campos_visibles
    Log    ${url} ${navegador} ${nombre} ${apellido} ${email} ${currentAddress} ${permanentAddress}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    Sleep    ${time}
    ${validaName}=  set variable    id=userName
    element should be visible    ${validaName}
    Input Text    id=userName   ${nombre} ${apellido}
    ${validaEmail}=    set variable    id=userEmail
    element should be enabled   ${validaEmail}
    Input Text    id=userEmail  ${email}
    Input Text    id=currentAddress    ${currentAddress}
    Execute Javascript    window.scrollTo(0, 300)
    Sleep    ${time}
    Input Text    id=permanentAddress  ${permanentAddress}
    Click Button    id=submit
    Sleep    ${time}
    Close Browser

Mi septimo Test
    [Documentation]     Septima prueba de validacion de campos por atributo
    [Tags]    test_valida_atributo_campo
    Log    ${url} ${navegador} ${nombre} ${apellido} ${email} ${currentAddress} ${permanentAddress}
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    Sleep    ${time}
    ${validaName}=  set variable    id=userName
    element should be visible    ${validaName}
    Input Text    id=userName   ${nombre} ${apellido}
    ${validaEmail}=    set variable    id=userEmail
    element should be enabled   ${validaEmail}
    Input Text    id=userEmail  ${email}
    #valida por el atributo
    ${dir}=  set variable    id=currentAddress
    element attribute value should be    ${dir}    placeholder    Current Address
    Input Text    id=currentAddress    ${currentAddress}
    Execute Javascript    window.scrollTo(0, 300)
    Sleep    ${time}
    Input Text    id=permanentAddress  ${permanentAddress}
    Click Button    id=submit
    Sleep    ${time}
    Close Browser

*** Keywords ***
