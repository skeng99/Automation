*** Settings ***
Library     SeleniumLibrary
Suite Setup    Open Browser To Login Page
Resource          ../Resources/Keyword.robot
Library     FakerLibrary

*** Test Cases ***
Validation for the user add attempt with all of the required fields valid
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
    Search The Fields   ${first_name}   ${email}
    Page Should Contain    ${email}

