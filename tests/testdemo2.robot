*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
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
    Select the Card with title    iphone X
Fill the Login details
    Fill the Login details and select user option





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
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =    Get WebElements    css:.card-title a
    @{actualList} =    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}

Select the Card with title
    [arguments]    ${cardTitle}
    ${elements} =    Get WebElements    css:.card-title a
    ${index} =    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardTitle}' == '${element.text}'
        ${index} =    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
Fill the Login details and select user option
    Input Text    ${USERNAME_INPUT}    rahulshettyacademy
    Input Text    ${PASSWORD_INPUT}    Learning@830$3mK2
    Select Radio Button    radio    user
    Wait Until Element Is Visible    okayBtn    timeout=10s
    Click Button    okayBtn
    Execute Javascript
    ...    var m = document.getElementById('myModal');
    ...    if (m) { m.style.display = 'none'; m.classList.remove('show'); }
    ...    document.body.classList.remove('modal-open');
    ...    var bd = document.querySelector('.modal-backdrop');
    ...    if (bd) { bd.parentNode.removeChild(bd); }
    Wait Until Element Is Not Visible    id:myModal    timeout=10s
    Select From List By Value    css:select.form-control    teach
    Click Button    ${SIGN_IN_BUTTON}
    Sleep    5s

    
