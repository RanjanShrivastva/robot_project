*** Settings ***
Documentation     This test case depicts the Data Driven testing
Test Template     Invalid Login2
Resource          ../common/commom_libraries.robot
Library           DataDriver    ../testData/user_login_data.xlsx    sheet_name=Sheet1

*** Test Cases ***
app_ddt_loginTestUsingExcelData
    [Setup]    Open My Browser
    [Teardown]    Close All Browser

*** Keywords ***
Invalid Login2
    [Arguments]    ${username}    ${password}
    log    Login Attempt for Username: ${username}
    Input Username    ${username}
    Input Password    ${password}
    Click On Login Button
    Error Message Should Be Visible When Password Is Empty
