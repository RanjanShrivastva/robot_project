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

api_testing_json_example
    ${json_obj}    Load JSON From File    D:\\demoProjects\\testData\\jsonSample.json
    ${name_value}    Get Value From Json    ${json_obj}    $.Name
    Should Be Equal    Amit    ${name_value[0]}
    ${city_value}    Get Value From Json    ${json_obj}    $.Address.City
    Should Be Equal    bangalore    ${city_value[0]}

api_testing_xml_example
    ${xml_obj}    Parse Xml    D:\\demoProjects\\testData\\xmlSample.xml
    ${title_value}    Get Element Text    ${xml_obj}    .//book[1]/title    #xpath
    Should Be Equal    ${title_value}    XML Developer's Guide
    ${genre_value}    Get Element Text    ${xml_obj}    .//book[1]/genre
    Should Be Equal    ${genre_value}    Computer
    #shortcut
    XML.Element Text Should Be    ${xml_obj}    Fantasy    .//book[2]/genre
    #Multiple Values
    ${child_elements}    Get Child Elements    ${xml_obj}
    Should Not Be Empty    ${child_elements}
    ${first_element}    Get Element Text    ${child_elements[0][0]}
    log    ${first_element}

*** Keywords ***
user keyword
    log    print data
