*** Settings ***
Library    SeleniumLibrary
Documentation  Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts.futbolkolektyw.pl/en/
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[@id='__next']/form/div/div[2]/button
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${ADDAPLAYERBUTTON}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[2]/div/div/a/button
${ADDPLAYERLOGO}    xpath=//*[@id="__next"]/div[1]/main/div[2]/form/div[1]/div/span
${NAMEINPUT}    xpath=//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[2]/div/div/input
${SURNAMEINPUT}     xpath=//*[@name ="surname"]
${AGEINPUT}     xpath=//*[@name ="age"]
${POSITIONINPUT}    xpath=//*[@aria-haspopup ="listbox"]
${SUBMITBUTTON}     xpath=//*[@id="__next"]/div[1]/main/div[2]/form/div[3]/button[1]
${PLAYERADDED}      xpath=//*[@id="5z393nvldv"]/div[1]

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser
    [Tags]  DEBUG

Add a player button
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on the Add a player button
    Assert Player Dashboard
    [Teardown]    Close Browser
    [Tags]  DEBUG

Adding a player
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on the Add a player button
    Assert Player Dashboard
    Type in name
    Type in surname
    Type in position
    Type in age
    Click Submit
    Assert player added
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
Click on the Add a player button
    Click Element    ${ADDAPLAYERBUTTON}
Type in name
    Input Text    ${NAMEINPUT}      alejajca
Type in surname
    Input Text    ${SURNAMEINPUT}       jakberety
Type in position
    Input Text    ${POSITIONINPUT}      Missionary
Type in age
    Input Text    ${AGEINPUT}       12122012
Click Submit
    Click Element    ${SUBMITBUTTON}
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert.png
Assert player dashboard
    Wait Until Element Is Visible   ${ADDPLAYERLOGO}
    Title Should Be    Add player
Assert player added
    Wait Until Element Is Visible    ${PLAYERADDED}