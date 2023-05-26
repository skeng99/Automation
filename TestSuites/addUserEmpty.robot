*** Settings ***
Library     SeleniumLibrary
Suite Setup    Open Browser To Login Page
Test Setup    Go To Login Page
Resource          ../Resources/Keyword.robot

*** Test Cases ***
Validation for the user add attempt with all of the required fields empty
#    Open Browser To Login Page
    Wait Until Page Contains    User Login
    Input Email     ${VALID USER}
    Input Password      ${VALID PASSWORD}
    Submit Credentials
    Sucessfull Login Message
    Go To Users
    Add Users With All Fields Empty

Validation for the user add attempt with email field empty
    Wait Until Page Contains    User Login
    Input Email     ${VALID USER}
    Input Password      ${VALID PASSWORD}
    Submit Credentials
    Sucessfull Login Message
    Go To Users
    Add Users With Email Field Empty

Validation for the user add attempt with firstname field empty
    Wait Until Page Contains    User Login
    Input Email     ${VALID USER}
    Input Password      ${VALID PASSWORD}
    Submit Credentials
    Sucessfull Login Message
    Go To Users
    Add Users With Firstname Field Empty

Validation for the user add attempt with lastname field empty
    Wait Until Page Contains    User Login
    Input Email     ${VALID USER}
    Input Password      ${VALID PASSWORD}
    Submit Credentials
    Sucessfull Login Message
    Go To Users
    Add Users With lastname Field Empty

Validation for the user add attempt with phone field empty
    Wait Until Page Contains    User Login
    Input Email     ${VALID USER}
    Input Password      ${VALID PASSWORD}
    Submit Credentials
    Sucessfull Login Message
    Go To Users
    Add Users With Phone Field Empty


