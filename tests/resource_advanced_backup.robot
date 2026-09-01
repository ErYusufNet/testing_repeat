*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# Login page
${LOGIN_PAGE_URL}               https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}                      Chrome
${USERNAME_INPUT}               id=username
${PASSWORD_INPUT}               id=password
${SIGN_IN_BUTTON}               id=signInBtn
${ERROR_MESSAGE_LOGIN}          css:.alert-danger
# Shopping page
${CHECKOUT_LINK}                css:.nav-link.btn.btn-primary
# Test data
${VALID_USERNAME}               rahulshettyacademy
${INVALID_PASSWORD}             12345678
${VALID_PASSWORD}               Learning@830$3mK2
${INVALID_LOGIN_ERROR_MESSAGE}  Incorrect username/password.


*** Keywords ***
Open Browser To URL
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Close Current Browser
    Close Browser

Open Login Page
    Open Browser To URL    ${LOGIN_PAGE_URL}    ${BROWSER}

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

Verify Login Error Message
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${ERROR_MESSAGE_LOGIN}
    Element Text Should Be    ${ERROR_MESSAGE_LOGIN}    ${expected_message}

Verify Shopping Page Is Displayed
    Wait Until Element Is Visible    ${CHECKOUT_LINK}
    Page Should Contain Element    ${CHECKOUT_LINK}
