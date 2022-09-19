*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  ../ExternalKeywords//Locators.py
Resource  ../Resources/Resources1.robot
Test Setup  Start Browser and Maximize    ${URL}    ${Browser}
Test Teardown  Close All Browsers

*** Variables ***
${Browser}    Chrome
${URL}    http://www.thetestingworld.com/testings
${URL1}    http://www.google.com

*** Test Cases ***
TC001 Browser Start and Close
    [Tags]  Sanity
    [Documentation]  This is first test case documentation
    # [Setup]  Start Browser and Maximize  ${URL}  ${Browser}  
    # Create folder at runtime  Testing
    ${email}=  Read Element Locators    Registration.email_textbox_name
    ${username}=  Read Element Locators    Registration.username_textbox_name
    ${password}=  Read Element Locators    Registration.password_textbox_name
    ${submit}=  Read Element Locators    Registration.submit_input_css
    Set Selenium Speed    0.5   
    Input Text    name:${email}    testingworld@mail.com
    ${rows}=  Read number of rows    Sheet1
    # Enter Username Email  testing  testingworld@mail.com
    FOR  ${i}  IN RANGE  1  ${rows}+1
        ${user}=  Read data from excell    Sheet1    ${i}    1
        ${pass}=  Read data from excell    Sheet1    ${i}    2
        Input Text    name:${username}    ${user}
        Input Text    name:${password}    ${pass}
        Click Button    css:${submit}
    END 
    # Click Button    xpath://${submit}   
    # Execute Javascript  window.scrollTo(0,700)
    Select From List By Index    name:sex  2
    Page Should Contain    Register
    # Capture Page Screenshot  C:/Users/Lukasz_Kot/.vscode/robot/TC001.png

TC002 Variable Test
    @{List1}  Create List  "Hello"  22  23.23  "World"  "Abcd345"
    ${var}=  Set Variable  YES
    # ${list_length}  Get Length    ${List1} 
    # Log To Console    ${list_length}
    # ${list_data}=  Get From List    ${List1}    3
    # Log To Console    ${list_data}
    # FOR  ${i}  IN RANGE  1  10
    #   log to console  ${i}
    # END
    FOR  ${i}  IN  @{List1}
      Continue For Loop If    ${i} == 23.23
      log to console  ${i}
    END
    Run Keyword If    '${var}'=='YES'    Log To Console    Value found

TC003 Browsers
    Open Browser  ${URL}    ${Browser}
    Maximize Browser Window
    Open Browser  ${URL1}    ${Browser}
    Maximize Browser Window
    Switch Browser    1
    ${url1}=  Get Location
    Log To Console    ${url1}
    Switch Browser    2
    ${url1}=  Get Location
    Log To Console    ${url1}
    

*** Keywords ***
Enter Username Email
    [Arguments]  ${username}  ${email}
    Input Text    name:fld_username    ${username}
    Input Text    name:fld_email    ${email}

Read Element Locators
    [Arguments]  ${JsonPath}
    ${result}=  Read Locator From Json    ${JsonPath}
    [Return]  ${result}