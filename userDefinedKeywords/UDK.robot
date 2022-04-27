*** Settings ***
Resource          ../testData/userProvidedValues.robot
Resource          ../pageObjects/homePage.robot
Resource          ../pageObjects/loginPage.robot
Library           SeleniumLibrary
Library           requests
Library           RequestsLibrary
Library           OperatingSystem

*** Keywords ***
appLogin
    Open Browser    ${app_URL}    ${browserName}
    Maximize Browser Window
    sleep    ${delay_short}
    Input text    ${textbox_username_xpath}    ${username_value}
    sleep    ${delay_short}
    Input text    ${textbox_password_xpath}    ${password_value}
    sleep    ${delay_short}
    Click Element    ${button_login_xpath}
    sleep    ${delay_short}

close_browsers
    Close Browser
    Close All Browsers
