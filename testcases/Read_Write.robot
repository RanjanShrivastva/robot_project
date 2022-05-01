*** Settings ***
Resource          ../common/commom_libraries.robot
Library           ExcelLibrary

*** Test Cases ***
TC01 Read Data From CSV
    Read CSV File    D:\\demoProjects\\testData\\user_data_csv.csv

TC02 Read Excel
    Open Excel Document    D:\\demoProjects\\testData\\user_login_data.xlsx    login data
    ${no_of_sheets}    Get List Sheet Names
    Comment    Log To Console    ${no_of_sheets}
    ${cell_data}    Read Excel Cell    1    1
    Comment    Log To Console    ${cell_data}
    ${no_of_rows}    Read Excel Row    1
    Comment    Log To Console    ${no_of_rows}
    ${rows_len}    Get Length    ${no_of_rows}
    ${rows_len}    Convert To Integer    ${rows_len}
    Comment    Log To Console    ${rows_len}
    ${no_of_cols}    Read Excel Column    1
    Comment    Log To Console    ${no_of_cols}
    ${cols_len}    Get Length    ${no_of_cols}
    ${cols_len}    Convert To Integer    ${cols_len}
    log    ${rows_len}

*** Keywords ***
Read Data Using For Loop
    [Arguments]    ${row_number}    ${cols_len}
    FOR    ${cols_number}    IN    RANGE    1    ${cols_len}
        Comment    ${print_data}    Read Excel Cell    ${row_number}    ${cols_number}
        log    ${cols_number}
        Comment    Log To Console    ${print_data}
    END
