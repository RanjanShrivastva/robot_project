*** Settings ***
Resource          ../testData/userProvidedValues.robot
Resource          ../pageObjects/homePage.robot
Resource          ../pageObjects/loginPage.robot
Resource          ../common/commom_libraries.robot
Library           SeleniumLibrary
Library           requests
Library           RequestsLibrary
Library           OperatingSystem
Library           DatabaseLibrary

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
    ${data_set}    Get File    ${file_name}
    Comment    log    ${data_set}
    FOR    ${data}    IN    ${data_set}
        log    *************************
        log    ${data}
    END
    log    ${data_set}[0]

Invalid Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click On Login Button
    Error Message Should Be Visible When Password Is Empty

Launch App Browser
    [Arguments]    ${URL}
    Open Browser    ${URL}    gc
    Maximize Browser Window

Establish Database Connection
    #    module    db name    username    password    host    port
    Connect To Database    pymysql    mydb    root    Mysql2022@@@    127.0.0.1    3306

Disconnect From Database
    DatabaseLibrary.Disconnect From Database

Parameterized For Loop
    [Arguments]    ${rows_len}    ${outer_loop}
    FOR    ${inner_loop}    IN RANGE    1    ${rows_len}+1
        ${cell_data}    Read Excel Cell    ${outer_loop}    ${inner_loop}
        log    ${cell_data}
    END

Establish Database Connection_pdb
    # Keyword    DB NAME    DB_USERNAME    DB_PASSWORD    DB_HOST    DB_PORT
    Connect To Postgresql    ecom    postgres    postgres    127.0.0.1    5432
    Comment    ${query}=    PostgreSQLDB.Execute Sql String    SELECT * from customers;
    Comment    log    Database connection established

Disconnect From Database_pdb
    PostgreSQLDB.Disconnect From Postgresql
