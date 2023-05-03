*** Settings ***
Library    SeleniumLibrary
Documentation  Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[@id='__next']/form/div/div[2]/button
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser
    [Tags]  DEBUG


*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Type in email
    Input Text    ${EMAILINPUT}     user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-1234
Click on the Submit button
    Click Element    ${SIGNINBUTTON}
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert.png
