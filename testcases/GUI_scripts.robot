*** Settings ***
Test Template
Resource          ../common/commom_libraries.robot

*** Variables ***

*** Test Cases ***
app_login_01
    [Tags]    reg
    Open Browser    https://www.flipkart.com/    gc
    Maximize Browser Window
    sleep    2
    Input text    //* [@class='_2IX_2- VJZDxU']    ${username_value}
    sleep    2
    Input text    //* [@type='password']    ${password_value}
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
    App Login
    #Closing all running browsers
    Close All Browsers

app_radio_dropdown_checkbox_example
    # Launching Browser as chrome
    Open Browser    https://www.functionize.com/h/test-automation?utm_source=google&utm_medium=paid%20search&utm_campaign=automated%20web%20testing&gclid=CjwKCAjw9qiTBhBbEiwAp-GE0SWDDqMwxZ9iMu-SZdx_WMVvbLRVG3rpzSqRJllTBCoz_5Hvw3mMexoCgcoQAvD_BwE    gc
    # Maximize browser window
    Maximize Browser Window
    # Enter values in check box
    Input Text    //*[@name='firstname']    Ranjan
    Input Text    //*[@name='lastname']    Shrivastava
    Input Text    //*[@name='email']    rk@jio.com
    Input text    //*[@name='phone']    9738308627
    Input text    //*[@name='company']    xyz technologies
    # Select Values from dropdown
    Select From List By Value    //*[@name='job_role']    QA Analyst / Test Analyst
    Select From List By Value    //*[@name='total_size_of_test_suite']    0-500
    # Click on radio button
    Click Element    //*[@id="do_you_have_any_hands_on_experience_with_selenium_or_other_scripted_automation_0-e65821c3-a1ec-4b15-9767-25c917c9afc1"]
    Comment    Select Radio Button    //*[@id="do_you_have_any_hands_on_experience_with_selenium_or_other_scripted_automation_0-e65821c3-a1ec-4b15-9767-25c917c9afc1"]    Yes
    # Click on checkbox
    Select Checkbox    //*[@name="terms_and_conditions"]
    # Close Browser
    Close Browser

app_button_example
    Open Browser    https://demoqa.com/buttons    gc
    # To perform double click
    Double Click Element    //*[@id="doubleClickBtn"]
    # To perform right click
    Open Context Menu    //*[@id="rightClickBtn"]
    # To perform single click
    sleep    5
    Click Element    //*[@class="mt-4"][2]//*[@class="btn btn-primary"]
    Close All Browser

app_upload_download
    Open Browser    https://demoqa.com/upload-download    gc
    # To perform upload
    Click Element    //a[@id='downloadButton']
    # To perform download
    Choose File    //input[@id='uploadFile']    C:\\Users\\ranja\\OneDrive\\Desktop\\dummy.xlsx

app_switch_newTab
    Open Browser    https://demoqa.com/browser-windows    gc
    Click Element    //button[@id='tabButton']
    ${main_window_titles}    Get Window Titles
    # To switch new tab
    ${handles}    Get Window Handles
    Switch Window    ${handles}[1]
    ${sample_text}    Get Text    //h1[@id="sampleHeading"]
    log    ${sample_text}
    sleep    2
    Close Browser

app_switch_newWindow
    Open Browser    https://demoqa.com/browser-windows    gc
    Click Element    //button[@id='windowButton']
    Maximize Browser Window
    # To switch new window
    ${handles}    Get Window Handles
    Switch Window    ${handles}[1]
    ${sample_text}    Get Text    //h1[@id="sampleHeading"]
    log    ${sample_text}
    Maximize Browser Window
    sleep    2
    # To switch back main window
    Switch Window    ${handles}[0]

app_switch_multiBrowser
    Open Browser    https://demoqa.com/browser-windows    gc    alias=first_window
    Maximize Browser Window
    log    1st window open
    ${window_handles}    Get Window Handles
    FOR    ${window}    IN    ${window_handles}
        log    ${window}
    END
    sleep    2
    log    2nd window open
    Open Browser    https://google.com    gc    alias=second_window
    Maximize Browser Window
    ${window_handles}    Get Window Handles
    FOR    ${window}    IN    ${window_handles}
        log    ${window}
    END
    sleep    2
    Switch Browser    1
    ${window_1}    Get Title
    log    ${window_1}
    log    switched to 1st window
    ${window_handles}    Get Window Handles
    FOR    ${window}    IN    ${window_handles}
        log    ${window}
    END
    sleep    2
    Switch Browser    2
    ${window_2}    Get Title
    log    switched to 2nd window
    log    ${window_2}
    ${window_handles}    Get Window Handles
    FOR    ${window}    IN    ${window_handles}
        log    ${window}
    END

test
    Comment    log    @{nums}[0]
    Comment    log    @{nums}
    log    @{hello}[0]

app_alert
    Open Browser    https://demoqa.com/alerts    gc
    Maximize Browser Window
    # Accept Alert
    Click Element    //button[@id='alertButton']
    sleep    2
    Handle Alert    ACCEPT
    # Dismiss Alert
    Click Element    //button[@id="timerAlertButton"]
    sleep    7
    Handle Alert    DISMISS
    [Teardown]    Close Browser

app_frame
    Launch App Browser    https://demoqa.com/frames
    Select Frame    //*[@id="frame1"]
    ${myString}    Get Text    //h1[@id="sampleHeading"]
    log    ${myString}

app_sleep_speed_timeout_Implict
    Launch App Browser    https://demoqa.com/automation-practice-form
    # Sleep
    sleep    5
    # Selenium Speed
    ${s_speed}=    Get Selenium Speed
    log    ${s_speed}
    Set Selenium Speed    3
    Input Text    //*[@id="firstName"]    Hello
    Input Text    //*[@id="lastName"]    Robot
    ${s_speed}=    Get Selenium Speed
    log    ${s_speed}
    # Selenium Timeout
    ${s_timeout}    Get Selenium Timeout
    log    ${s_timeout}
    Set Selenium Timeout    10
    ${s_timeout}    Get Selenium Timeout
    log    ${s_timeout}
    Comment    Wait Until Page Contains    adsf    # enable in webinar
    ${siw}    Get Selenium Implicit Wait
    log    ${siw}
    Set Selenium Implicit Wait    10
    log    ${siw}
    Wait Until Page Contains    adsf

use_of_custom_keyword
    count_of_characters    Ranjan

html_table_validation
    Open Browser    https://www.w3schools.com/html/html_tables.asp    gc
    Maximize Browser Window
    ${rows_count}    Get Element Count    //table[@id="customers"]/tbody/tr
    ${cols_count}    Get Element Count    //table[@id="customers"]/tbody/tr[1]/th
    Log To Console    ${rows_count}
    Log To Console    ${cols_count}
    ${captured_data}    Get Text    //table[@id="customers"]/tbody/tr[5]/td[1]
    Log To Console    ${captured_data}
    table column should contain     //table[@id="customers"]    2    Contact
    table row should contain     //table[@id="customers"]    4    Ernst Handel
    table cell should contain    //table[@id="customers"]    4    2    Roland Mendel
    table header should contain    //table[@id="customers"]    Country
    [Teardown]    Close Browser

*** Keywords ***
