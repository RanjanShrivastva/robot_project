*** Settings ***
Resource          ../common/commom_libraries.robot

*** Test Cases ***
TC01 Read Excel
    Open Excel Document    D:\\demoProjects\\testData\\user_login_data.xlsx    login data
    ${no_of_sheets}    Get List Sheet Names
    ${cell_data}    Read Excel Cell    1    1
    ${no_of_rows}    Read Excel Row    1
    ${rows_len}    Get Length    ${no_of_rows}
    ${rows_len}    Convert To Integer    ${rows_len}
    ${no_of_cols}    Read Excel Column    1
    ${cols_len}    Get Length    ${no_of_cols}
    ${cols_len}    Convert To Integer    ${cols_len}
    FOR    ${outer_loop}    IN RANGE    1    ${cols_len}+1
        Parameterized For Loop    ${rows_len}    ${outer_loop}
    END

*** Keywords ***
Read Data Using For Loop
    [Arguments]    ${row_number}    ${cols_len}
    FOR    ${cols_number}    IN    RANGE    1    ${cols_len}
        Comment    ${print_data}    Read Excel Cell    ${row_number}    ${cols_number}
        log    ${cols_number}
        Comment    Log To Console    ${print_data}
    END
