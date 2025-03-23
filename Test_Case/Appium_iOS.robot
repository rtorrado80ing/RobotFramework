#Para hacer pruebas en paralelo
#appium --port 4723 --default-capabilities '{"wdaLocalPort":8100,"newCommandTimeout":0,"platformName":"iOS","automationName":"XCUITest"}'
*** Settings ***
Library    AppiumLibrary     run_on_failure=Capture Page Screenshot
Library    String


*** Variables ***
${appium_host}=  http://0.0.0.0:4723/wd/hub
${platform_name}=    iOS
${platformVersion}=     11.3.1
${udid}=     *****
${app}=      Settings
${deviceName}=     iPhone 5s
${startX}=       160
${endX}=         0
${startY}=       190
${endY}=         350

${search_loc}=     //XCUIElementTypeSearchField[@name='Search']
${switch_hotspot}=       //XCUIElementTypeSwitch[@name='Personal Hotspot']
${wifi_loc}=         //XCUIElementTypeStaticText[@name='Wi-Fi']
${wifi_switch_loc}=        //XCUIElementTypeSwitch[@name='Wi-Fi']

*** Test Cases ***
App_Test_1
    [Documentation]    Test case to understand robotframework with appium
    Open Application    ${appium_host}
    ...    platformName=${platform_name}
    ...    deviceName=${deviceName}
    ...    app=${app}
    ...    udid=${udid}
    ...    platformVersion=${platformVersion}
    ...    automationName=XCUITest

    Sleep    2
    Swipe    ${startX}    ${startY}    ${endX}    ${endY}    1000
    Sleep    2
    Capture Page Screenshot

    Wait Until Element Is Visible    ${wifi_loc}    10s
    Click Element    ${wifi_loc}
    Sleep    2
    Click Element    ${wifi_switch_loc}
    Capture Page Screenshot
