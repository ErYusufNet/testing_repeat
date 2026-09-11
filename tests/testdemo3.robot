*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    re
Test Setup      Open Login Page
Test Teardown   Close Browser Session
Resource    resource.robot


*** Variables ***
${URL}    https://rahulshettyacademy.com/loginpagePractise/
${error_message_login}    ss:.alert-danger


*** Test Cases ***
Validate child window functionality
    select the link of child window
    Verify the user switched to child window
    grab the email id in the child window
    switch to parent window and enter the email



*** Keywords ***
select the link of child window
    Click Link    css:.blinkingText
    Sleep    5
Verify the user switched to child window
    Switch Window    NEW
    Element Text Should Be    css:.inner-box   DOCUMENTS REQUEST


Grab the Email id in the Child Window
    ${email_text} =    Get Text    css:a[href*='mailto']
    Log    ${email_text}
    Set Global Variable    ${email_text}
switch to parent window and enter the email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id=username    ${email_text}
    Sleep    5