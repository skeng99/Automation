*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Keyword.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail


*** Test Cases ***               USER NAME        PASSWORD
Empty Email                  ${EMPTY}         ${VALID PASSWORD}
Empty Password                ${VALID USER}    ${EMPTY}
Empty Email And Password      ${EMPTY}         ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Email    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Wait Until Page Contains    This is a required field
    Page Should Contain    This is a required field


