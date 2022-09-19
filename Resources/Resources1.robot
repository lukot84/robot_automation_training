*** Settings ***
Library  SeleniumLibrary
Library  ../ExternalKeywords/UserKeywords.py
Library  ../TestData/ReadData.py

*** Variables ***

*** Keywords ***
Start Browser and Maximize
    [Documentation]  This is keyword for start browser
    [Arguments]  ${UserURL}  ${InputBrowser}
    Open Browser  ${UserURL}  ${InputBrowser}
    Maximize Browser Window
    ${Title}=  Get Title
    [Return]  ${Title}

Create folder at runtime
    [Arguments]  ${foldername}
    Create Folder With Name    ${foldername}

Read number of rows
    [Arguments]  ${sheetname}
    ${maxrows}=  Fetch Number Of Rows    ${sheetname}
    [Return]  ${maxrows}

Read data from excell
    [Arguments]  ${sheetname}  ${row}  ${cell}
    ${data}=  Fetch Cell Data    ${sheetname}    ${row}    ${cell}
    [Return]  ${data}