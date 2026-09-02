*** Settings ***
Documentation    The system specific keywords created here form our own
...              domain specific language. They utilize keywords provided
...              by the imported SeleniumLibrary.
Library    SeleniumLibrary


*** Variables ***
# Login page
${URL}                 https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}                        Chrome
${USERNAME_INPUT}                 id=username
${PASSWORD_INPUT}                 id=password
${SIGN_IN_BUTTON}                 id=signInBtn
${ERROR_MESSAGE_LOGIN}            css:.alert-danger
# Shopping page
${CHECKOUT_LINK}                  css:.nav-link.btn.btn-primary
# Test data
${user_name}                 rahulshettyacademy
${invalid_password}              12345678
${valid_password}                Learning@830$3mK2
${INVALID_LOGIN_ERROR_MESSAGE}    Incorrect username/password.


*** Keywords ***
Open Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close Browser Session
    Close Browser

