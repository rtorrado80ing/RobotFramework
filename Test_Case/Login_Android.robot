#Para subir solo uno
#appium -ka 800 --base-path=/wd/hub
#Activando el log para mas detalle
#appium -ka 800 --log-level debug --base-path=/wd/hub
#Para ejecutar el caso
#robot -d ReporteAppium  Test_Case/Login_Android.robot
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
