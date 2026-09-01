*** Settings ***
Documentation    The system specific keywords created here form our own
...              domain specific language. They utilize keywords provided
...              by the imported SeleniumLibrary.
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
open the browser with the Mortgage payment url
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    Chrome
    Maximize Browser Window

Close Browser session
    Close Browser
