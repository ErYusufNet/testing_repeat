*** Settings ***
Documentation    Validate successful login flow
Resource        resource.robot
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser session

*** Variables ***
${USERNAME_INPUT}       id=username
${PASSWORD_INPUT}       id=password
${SIGN_IN_BUTTON}       id=signInBtn
${CHECKOUT_LINK}        css:.nav-link.btn.btn-primary
${VALID_USERNAME}       rahulshettyacademy
${VALID_PASSWORD}       Learning@830$3mK2

*** Test Cases ***
Validate Cards Display In The Shopping Page
    [Documentation]    Verify that a valid user can log in and reaches the shopping page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Shopping Page Is Displayed

*** Keywords ***
Input Login Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}

Submit Login
    Click Button    ${SIGN_IN_BUTTON}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Login Credentials    ${username}    ${password}
    Submit Login

Verify Shopping Page Is Displayed
    Wait Until Element Is Visible    ${CHECKOUT_LINK}
    Page Should Contain Element    ${CHECKOUT_LINK}
