*** Settings ***
Resource          ../common/commom_libraries.robot

*** Test Cases ***
api_testing_put_example
    Comment    Creating session
    Create Session    mySession    https://reqres.in/
    ${data}    Get File    D:\\demoProjects\\testData\\putdata.txt
    log    ${data}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    POST On Session    mySession    api/users/2    ${data}    ${headers}
    log    ${response.status_code}
    log    ${response.content}
    log    ${response.headers}

api_testing_post_example
    Comment    Creating session
    Create Session    mySession    https://reqres.in/
    ${data}    Get File    D:\\demoProjects\\testData\\postdata.txt
    log    ${data}
    Comment    ${data}    Evaluate    json.dumps($data)    json
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    POST On Session    mySession    api/users    ${data}    ${headers}
    log    ${response.status_code}
    log    ${response.content}
    log    ${response.headers}

api_testing_get_example
    Comment    Creating session
    ${id}    Set Variable    2
    Create Session    mySession    https://reqres.in/
    ${response}    GET On Session    mySession    api/users/${id}
    log    ${response.status_code}
    #validation
    ${responseCode_int}    Convert To Integer    ${responseCode}
    Should Be Equal    ${response.status_code}    ${responseCode_int}
    log    ${response.content}
    log    ${response.headers}

api_testing_delete_example
    Comment    Creating session
    Create Session    mySession    https://reqres.in/
    ${response}    Delete On Session    mySession    api/users/2
    log    ${response.status_code}
    log    ${response.content}
    log    ${response.headers}

abc
    user keyword

*** Keywords ***
user keyword
    log    print data
