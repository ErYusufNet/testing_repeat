*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Setup      Open Login Page
Test Teardown   Close Browser Session
Resource    resource.robot


*** Variables ***
${URL}    https://rahulshettyacademy.com/loginpagePractise/
${error_message_login}    css:.alert-danger


*** Test Cases ***
Validate UnSuccesful login

    Fill the login form     ${user_name}    ${invalid_password}
    Wait Until Element Is located in the page   ${error_message_login}
    verify error message is correct
Validate Cards display in Shopping page
    Fill the login form     ${user_name}    ${valid_password}
    Wait Until Element Is located in the page    ${CHECKOUT_LINK}
    Verify Card titles in the Shop page

*** Keywords ***

Fill the login form
    [arguments]     ${username}   ${password}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${SIGN_IN_BUTTON}
wait until it checks and display error message
    Wait Until Element Is Visible    ${error_message_login}
verify error message is correct
    Element Text Should Be    ${error_message_login}    Incorrect username/password.
Wait Until Element Is located in the page
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify Card titles in the Shop page
    @{card_titles} =  Create List    iphone X     Samsung Note 8      Nokia Edge      BlackBerry
    ${card_elements} =  Get WebElements    css:.card-title
    FOR  ${card_element}    IN      @{card_elements}
        Log    ${card_element.text}
    END


