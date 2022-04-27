*** Settings ***
Resource          ../common/commom_libraries.robot

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
    Comment    Capture Page Screenshot
    ${user_name}    get text    //*[@class='exehdJ']
    log    ${user_name}
    Should Be Equal    ${user_name}    Ranjan
    Comment    Click Element    //* [@class='_2KpZ6l _2HKlqd _3AWRsL']4555
    Close Browser

pom_app_login
    [Documentation]    This test case is desgined in POM
    [Tags]    regression
    # Login to application
    appLogin
    #Closing all running browsers
    Close All Browsers
