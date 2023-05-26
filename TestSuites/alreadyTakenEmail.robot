*** Settings ***
Library     SeleniumLibrary
Suite Setup    Open Browser To Login Page
Resource          ../Resources/Keyword.robot
Library     FakerLibrary

*** Variables ***
${emailalreadytaken}    Prashant143@gmail.com


*** Test Cases ***
Validation for the user add attempt with the email that has already been taken by another user
    Wait Until Page Contains    User Login
    Input Email     ${VALID USER}
    Input Password      ${VALID PASSWORD}
    Submit Credentials
    Sucessfull Login Message
    Go To Users
    ${first_name}   FakerLibrary.first_name
    ${lastname}     FakerLibrary.Name
    ${email}    FakerLibrary.email
    Add Users With All Fields Valid  ${first_name}   ${lastname}     ${email}
    Wait Until Page Contains    User added successfully
    Page Should Contain    User added successfully
    Go To Users
    Add Users With All Fields Valid  ${first_name}   ${lastname}     ${email}
    Wait Until Page Contains    Email already taken
    Page Should Contain    Email already taken


