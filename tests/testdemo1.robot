*** Settings ***
Documentation    Validate the login form
Library          SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${URL}           https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}       Chrome
${Error_Message_Login}    css:.alert-danger


*** Test Cases ***
Validate Unsuccessful Login
    [Documentation]    Verify that an incorrect username/password displays an error message
    Open Login Page
    Set Selenium Speed    0.5s
    Maximize Browser Window
    Fill Login Form
    Wait Until Element Is Visible    ${Error_Message_Login}
    Verify Error Message Is Correct
    Sleep    5s
    [Teardown]    Close All Browsers

*** Keywords ***
Open Login Page
    Open Browser    ${URL}    ${BROWSER}

Fill Login Form
    Input Text      id=username    rahulshettyacademy
    Input Text      id=password     12345678
    Click Button    id=signInBtn


Verify Error Message Is Correct

    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.


