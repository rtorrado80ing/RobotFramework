*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${ruta_fotos_pagina}=   F:/Documentos/WorkspaceRobotFramework/PyCharm/RobotFramework/Reportes/Img

*** Keywords ***
F_texto
    [Arguments]     ${sel}      ${dato}
    wait until element is visible    ${sel}
    input text    ${sel}     ${dato}

F_enter
    [Arguments]     ${sel}
    wait until element is visible    ${sel}
    Press Keys    ${sel}        ENTER

F_foto_pagina
    [Arguments]    ${nombre_imagen}
    capture page screenshot    ${ruta_fotos_pagina}/${nombre_imagen}

F_foto_selector
    [Arguments]     ${sel}    ${nombre_imagen}
    wait until element is visible    ${sel}
    wait until element is enabled    ${sel}
    element should be visible    ${sel}
    capture element screenshot    ${sel}    ${ruta_fotos_pagina}/${nombre_imagen}