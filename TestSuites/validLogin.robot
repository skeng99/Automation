*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../Resources/Keyword.robot

*** Test Cases ***
Valid Login with correct credentials
    Open Browser To Login Page
    Wait Until Page Contains    User Login
    Input Email     ${VALID USER}
    Input Password      ${VALID PASSWORD}
    Submit Credentials
    Sucessfull Login Message
    [Teardown]    Close Browser