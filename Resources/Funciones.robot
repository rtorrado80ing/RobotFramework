*** Settings ***
Library     SeleniumLibrary

*** Variables ***
# Ruta base para guardar las capturas de pantalla
${ruta_fotos_pagina}=   ../Reportes/Img

*** Keywords ***
F_texto
    [Documentation]    Espera a que el elemento sea visible y escribe el texto indicado.
    [Arguments]     ${selector}    ${valor}
    Wait Until Element Is Visible    ${selector}
    Input Text                       ${selector}    ${valor}

F_enter
    [Documentation]    Espera a que el elemento sea visible y presiona la tecla ENTER.
    [Arguments]     ${selector}
    Wait Until Element Is Visible    ${selector}
    Press Keys                       ${selector}    ENTER

F_foto_pagina
    [Documentation]    Captura una captura de pantalla de toda la página con nombre personalizado.
    [Arguments]    ${nombre_imagen}
    Capture Page Screenshot    ${ruta_fotos_pagina}/${nombre_imagen}

F_foto_selector
    [Documentation]    Captura una imagen del elemento indicado, verificando visibilidad y disponibilidad.
    [Arguments]    ${selector}    ${nombre_imagen}
    Wait Until Element Is Visible    ${selector}
    Wait Until Element Is Enabled    ${selector}
    Element Should Be Visible        ${selector}
    Capture Element Screenshot       ${selector}    ${ruta_fotos_pagina}/${nombre_imagen}
