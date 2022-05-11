*** Settings ***
Library           DatabaseLibrary
Resource          ../common/commom_libraries.robot

*** Test Cases ***
create new table
    [Setup]    Establish Database Connection
    ${output}    Execute Sql String    create table person(id integer, first_name varchar(100), last_name varchar(100))
    log    ${output}
    Should Be Equal As Strings    ${output}    None
    [Teardown]    UDK.Disconnect From Database

insert data in table
    [Setup]    Establish Database Connection
    ${output}    Execute Sql String    insert into person values(106, "amit", "kumar")
    log    ${output}
    Should Be Equal As Strings    ${output}    None
    [Teardown]    UDK.Disconnect From Database

insert multiple data in table
    [Setup]    Establish Database Connection
    ${output}    Execute Sql Script    D:\\demoProjects\\testData\\insert_multiple_data.sql
    log    ${output}
    Should Be Equal As Strings    ${output}    None
    [Teardown]    UDK.Disconnect From Database

validate data in table
    [Setup]    Establish Database Connection
    Check If Exists In Database    select * from mydb.person where first_name="amit";
    Check If Not Exists In Database    select * from mydb.person where first_name="hello";
    Table Must Exist    person
    Row Count Is 0    select * from mydb.person where first_name="hello";
    Row Count Is Equal To X    select * from mydb.person where first_name="amit";    1
    ${row_counts}    Row Count    select * from mydb.person;
    log    ${row_counts}
    [Teardown]    UDK.Disconnect From Database

update data in table
    [Setup]    Establish Database Connection
    ${output}    Execute Sql String    update mydb.person set first_name="shiva" where id=101;
    log    ${output}
    Should Be Equal As Strings    ${output}    None
    [Teardown]    UDK.Disconnect From Database

retrieve data from table
    [Tags]    db
    [Setup]    Establish Database Connection
    ${query_results}    query    select * from mydb.person;
    log    ${query_results}[0][0]
    log    ${query_results}[0][1]
    log    ${query_results}[0][2]
    log    ${query_results}[1][0]
    Log To Console    ${query_results}
    Set Global Variable    ${query_results}
    [Teardown]    UDK.Disconnect From Database
