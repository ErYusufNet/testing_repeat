*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown   Close Browser
Test Template    Validate UnSuccesful login


*** Variables ***
${URL}    https://rahulshettyacademy.com/loginpagePractise/
${error_message_login}    css:.alert-danger


*** Test Cases ***      username        password
Invalid username        dsahed          learning
Invalid password        rahul           12345678
special characters      @#$             learning

*** Keywords ***
Validate UnSuccesful login
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Fill the login form
    wait until it checks and display error message
    verify error message is correct


Fill the login form
    Input Text    id=username    rahulshettyacademy
    Input Text    id=password    12345678
    Click Button    id=signInBtn
wait until it checks and display error message
    Wait Until Element Is Visible    ${error_message_login}
verify error message is correct
    Element Text Should Be    ${error_message_login}    Incorrect username/password.
