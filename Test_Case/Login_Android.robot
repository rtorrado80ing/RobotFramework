*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/android-res.robot

*** Test Cases ***
Login
    [Documentation]    Test para iniciar sesión en la app Android
    Open Chat21 Application
    Signin With User    ${USER1-DETAILS}[email]    ${USER1-DETAILS}[password]
    Logout With User
    Signin With User    ${USER2-DETAILS}[email]    ${USER2-DETAILS}[password]
