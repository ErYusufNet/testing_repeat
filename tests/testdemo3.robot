*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown   Close Browser


*** Variables ***
${URL}    https://rahulshettyacademy.com/loginpagePractise/
${error_message_login}    ss:.alert-danger


*** Test Cases ***
Validate UnSuccesful login
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
Fill the login form
    Input Text    id=username    rahulshettyacademy
    Input Text    id=password    12345678
    Click Button    id=signInBtn
wait until it checks and display error message
    Wait Until Element Is Visible    ${error_message_login}
verify error message is correct
    Element Text Should Be    ${error_message_login}    Incorrect username/password.
