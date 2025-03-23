#Para correr pruebas en 2 dispositivos/emuladores en paralelo, haz lo siguiente
#Abre 2 terminales separadas y ejecuta:
#Para el primer dispositivo (puerto 8201):
#appium --port 4723 --default-capabilities "{ \"adbPort\":5037, \"systemPort\":8201, \"newCommandTimeout\":0, \"automationName\":\"UiAutomator2\", \"deviceName\":\"emulator-5554\" }"
#Para el segundo dispositivo (puerto 8202):
#appium --port 4725 --default-capabilities "{ \"adbPort\":5038, \"systemPort\":8202, \"newCommandTimeout\":0, \"automationName\":\"UiAutomator2\", \"deviceName\":\"emulator-5556\" }"
#en Mac y ejecuta
#appium --default-capabilities '{"adbPort":5037,"systemPort":8201,"newCommandTimeout":0,"automationName":"UiAutomator2"}'

*** Settings ***
Library    AppiumLibrary    run_on_failure=Capture Page Screenshot
Library    String

*** Variables ***
${appium_host}         http://127.0.0.1:4723/wd/hub
${platform_name}       Android
${platformVersion}     13.0
${deviceName}          emulator-5554
${appPackage}          chat21.android.demo
${appActivity}         chat21.android.demo.SplashActivity
${automationName}      UiAutomator2
${LOGIN-BUTTON}        id=chat21.android.demo:id/login
${CONTINUE-BUTTON}      //android.widget.Button[@resource-id="com.android.permissioncontroller:id/continue_button"]
${OK-BUTTON1}            //android.widget.Button[@resource-id="android:id/button1"]

*** Test Cases ***
App_Test_1
    [Documentation]    Test case to understand robotframework with appium
    Open Application    ${appium_host}
    ...    platformName=${platform_name}
    ...    deviceName=${deviceName}
    ...    appPackage=${appPackage}
    ...    appActivity=${appActivity}
    ...    platformVersion=${platformVersion}
    ...    automationName=${automationName}
    WAIT UNTIL ELEMENT IS VISIBLE    ${CONTINUE-BUTTON}
    Click Element    ${CONTINUE-BUTTON}
    WAIT UNTIL ELEMENT IS VISIBLE   ${OK-BUTTON1}
    CLICK Element    ${OK-BUTTON1}

    wait until page contains element    ${LOGIN-BUTTON}
    Sleep    5
    Capture Page Screenshot
    Close Application
