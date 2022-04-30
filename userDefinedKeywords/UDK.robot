*** Settings ***
Resource          ../testData/userProvidedValues.robot
Resource          ../pageObjects/homePage.robot
Resource          ../pageObjects/loginPage.robot
Library           SeleniumLibrary
Library           requests
Library           RequestsLibrary
Library           OperatingSystem

*** Keywords ***
Test Template
    Invalid Login

App Login
    Open Browser    ${app_URL}    ${browserName}
    Maximize Browser Window
    sleep    ${delay_short}
    Input text    ${textbox_username_xpath}    ${username_value}
    sleep    ${delay_short}
    Input text    ${textbox_password_xpath}    ${password_value}
    sleep    ${delay_short}
    Click Element    ${button_login_xpath}
    sleep    ${delay_short}

Close All Browser
    Close Browser
    Close All Browsers

Open My Browser
    Open Browser    ${app_URL}    ${browserName}
    Maximize Browser Window

Input Username
    [Arguments]    ${username}
    Input Text    ${textbox_username_xpath}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${textbox_password_xpath}    ${password}

Click On Login Button
    Click Element    ${button_login_xpath}

Error Message Should Be Visible When Password Is Empty
    Page Should Contain    Please enter Password

Error Message Should Be Visible When Username Is Empty
    Page Should Contain    Please enter valid Email ID/Mobile number

Error Message Should Be Visible When Username And Password Is Empty
    Page Should Contain    Please enter valid Email ID/Mobile number

Error Message Should Be Visible When Username Or Password Is Invalid
    Page Should Contain    Your username or password is incorrect

Message Should Be Visible When Username Or Password Is Valid
    Page Should Contain    Become a Seller

Read CSV File
    [Arguments]    ${file_name}
    ${data}    Get File    ${file_name}
    log    ${data}

Invalid Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click On Login Button
    Error Message Should Be Visible When Password Is Empty
