*** Settings ***
Library           SeleniumLibrary
Library           requests
Library           RequestsLibrary

*** Test Cases ***
app_login_01
    [Tags]    reg
    Open Browser    https://www.flipkart.com/    gc
    Maximize Browser Window
    sleep    2
    Input text    //* [@class='_2IX_2- VJZDxU']    9738308627
    sleep    2
    Input text    //* [@type='password']    Flipkart2022@@@
    sleep    2
    Click Element    //* [@class='_2KpZ6l _2HKlqd _3AWRsL']
    sleep    2
    Capture Page Screenshot
    Close Browser

api_testing
    Create Session    mySession    https://gorest.co.in
    ${response}    Get Request    mySession    /public/v2/posts
    log    ${response.status_code}
    log    ${response.content}
    log    ${response.headers}
