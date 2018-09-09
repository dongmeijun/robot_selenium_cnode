*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         118.31.19.120:3000
${BROWSER}        chrome
${DELAY}          10
${VALID USER}     testuser
${VALID PASSWORD}   123456
${LOGIN URL}      http://${SERVER}/signin
${IndexPage URL}    http://${SERVER}/
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    id:name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id:pass    ${password}

Submit Credentials
    click Element    class:span-primary

Welcome Page Should Be Open
    Location Should Be    ${IndexPage URL}
    Title Should Be    CNode：Node.js专业中文社区
