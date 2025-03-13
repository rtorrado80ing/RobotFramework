*** Settings ***
Library     AppiumLibrary
Resource    password.robot

*** Variables ***
#*** Test Variables ***
&{USER1-DETAILS}            email=rtorrado80@gmail.com      password=${PASSWORD}
&{USER2-DETAILS}            email=rftutorials2@gmail.com    password=${PASSWORD}

#*** Application Variables ***
${CHAT21-APPLICATION-ID}    chat21.android.demo:id

#*** Login Page ***
${LOGIN-EMAIL-FIELD}        id=${CHAT21-APPLICATION-ID}/email
${LOGIN-PASSWORD-FIELD}     id=${CHAT21-APPLICATION-ID}/password
${LOGIN-SIGNIN-BUTTON}      id=${CHAT21-APPLICATION-ID}/login
${LOGIN-BUTTON}             id=chat21.android.demo:id/login
${CONTINUE-BUTTON}          //android.widget.Button[@resource-id="com.android.permissioncontroller:id/continue_button"]
${OK-BUTTON1}               //android.widget.Button[@resource-id="android:id/button1"]

#*** Logout Page ***
${LOGOUT-BUTTON}            id=${CHAT21-APPLICATION-ID}/logout

#*** Main Page ***
${MAIN-HOME-TAB}            //android.widget.TextView[@text="Chat21"]
${MAIN-PROFILE-TAB}         //android.widget.TextView[@text="PROFILE"]

*** Keywords ***
Open Chat21 Application
    [Documentation]    Abre la aplicación en el dispositivo Android
    Open Application    ${appium_host}
    ...    platformName=${platform_name}
    ...    deviceName=${deviceName}
    ...    platformVersion=${platformVersion}
    ...    appPackage=${appPackage}
    ...    appActivity=${appActivity}
    ...    automationName=${automationName}
    Sleep    3

    # Verifica si hay alertas de permisos en Android 10+
    ${ALERT}    Run Keyword And Return Status    Wait Until Element Is Visible    ${CONTINUE-BUTTON}    timeout=3s
    Run Keyword If    ${ALERT} == True    Bypass Android 10 Alerts

Bypass Android 10 Alerts
    [Documentation]    Maneja alertas de permisos en Android 10+
    Click Element                    ${CONTINUE-BUTTON}
    Wait Until Element Is Visible    ${OK-BUTTON1}    timeout=5s
    Click Element                    ${OK-BUTTON1}

Signin With User
    [Arguments]    ${EMAIL}     ${USERPASSWORD}
    Input User Email        ${EMAIL}
    Input User Password     ${USERPASSWORD}
    Submit Login
    Verify Login Is Successful

Input User Email
    [Arguments]    ${EMAIL}
    Wait Until Page Contains Element    ${LOGIN-EMAIL-FIELD}    timeout=10s
    Input Text    ${LOGIN-EMAIL-FIELD}    ${EMAIL}

Input User Password
    [Arguments]    ${PASSWORD}
    Wait Until Page Contains Element    ${LOGIN-PASSWORD-FIELD}    timeout=10s
    Input Text    ${LOGIN-PASSWORD-FIELD}    ${PASSWORD}

Submit Login
    Click Element    ${LOGIN-SIGNIN-BUTTON}

Verify Login Is Successful
    Wait Until Page Contains Element    ${MAIN-HOME-TAB}    timeout=15s

Logout With User
    [Documentation]    Cierra la sesión del usuario actual y verifica el logout
    Go To Profile Page
    Click The Logout Button
    Verify Login Email Field Is Displayed

Go To Profile Page
    [Documentation]    Navega a la pestaña de perfil
    Wait Until Page Contains Element    ${MAIN-PROFILE-TAB}    timeout=10s
    Click Element    ${MAIN-PROFILE-TAB}

Click The Logout Button
    [Documentation]    Presiona el botón de logout y confirma si es necesario
    Wait Until Page Contains Element    ${LOGOUT-BUTTON}    timeout=10s
    Click Element    ${LOGOUT-BUTTON}

Verify Login Email Field Is Displayed
    [Documentation]    Verifica que el usuario fue deslogueado correctamente
    Wait Until Page Contains Element    ${LOGIN-EMAIL-FIELD}    timeout=10s
