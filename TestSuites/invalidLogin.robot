*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Keyword.robot
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail



*** Test Cases ***               USER NAME        PASSWORD
Invalid Email                 invalid          ${VALID PASSWORD}
Invalid Password                 ${VALID USER}    invalid
Invalid Email And Password    invalid          whatever

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Email    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Wait Until Page Contains    Please enter a valid email address
    Page Should Contain    Please enter a valid email address




