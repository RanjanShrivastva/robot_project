*** Settings ***
Library           SeleniumLibrary
Library           requests
Library           RequestsLibrary
Library           OperatingSystem
Resource          ../userDefinedKeywords/UDK.robot

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

api_testing_get_example
    Comment    Creating session
    ${id}    Set Variable    2
    Create Session    mySession    https://reqres.in/
    ${response}    GET On Session    mySession    api/users/${id}
    log    ${response.status_code}
    log    ${response.content}
    log    ${response.headers}

api_testing_post_example
    Comment    Creating session
    Create Session    mySession    https://reqres.in/
    ${data}    Get File    D:\\demoProjects\\flipkartDemoAutomation\\postdata.txt
    log    ${data}
    Comment    ${data}    Evaluate    json.dumps($data)    json
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    POST On Session    mySession    api/users    ${data}    ${headers}
    log    ${response.status_code}
    log    ${response.content}
    log    ${response.headers}

api_testing_put_example
    Comment    Creating session
    Create Session    mySession    https://reqres.in/
    ${data}    Get File    D:\\demoProjects\\flipkartDemoAutomation\\putdata.txt
    log    ${data}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    POST On Session    mySession    api/users/2    ${data}    ${headers}
    log    ${response.status_code}
    log    ${response.content}
    log    ${response.headers}

api_testing_delete_example
    Comment    Creating session
    Create Session    mySession    https://reqres.in/
    ${response}    Delete On Session    mySession    api/users/2
    log    ${response.status_code}
    log    ${response.content}
    log    ${response.headers}

pom_app_login
    [Documentation]    This test case is desgined in POM
    [Tags]    regression
    # Login to application
    appLogin
    #Closing all running browsers
    Close All Browsers
