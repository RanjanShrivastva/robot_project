*** Settings ***
Resource          ../common/commom_libraries.robot

*** Test Cases ***
TC01 Read Data From CSV
    Read CSV File    D:\\demoProjects\\testData\\user_data_csv.csv
