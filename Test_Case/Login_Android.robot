*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/android-res.robot

*** Test Cases ***
Login
    [Documentation]    Test para iniciar sesión en la app Android
 # Una sola ejecucion
    Open Chat21 Application

#Ejecucion en paralelo
#    Open Chat21 Application On First Device
    Signin With User    ${USER1-DETAILS}[email]    ${USER1-DETAILS}[password]
#    Open Chat21 Application On Second Device
    Logout With User
    Signin With User    ${USER2-DETAILS}[email]    ${USER2-DETAILS}[password]
