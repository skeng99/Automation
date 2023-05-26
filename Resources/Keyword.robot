*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${LOGIN URL}        https://gold.noveltytechnology.com/login
${VALID USER}     tester@noveltytechnology.com
${VALID PASSWORD}    P@ssw0rd@2023
${firstnamefield}    Prashant
${lastnamefield}     Nepal
${dob}  11271998
${gender}   male
${phone}    9878787879
${emailfield}    prashant@gmail.com


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    GoLD | Go Live on Day 1

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Email
    [Arguments]    ${username}
    Wait Until Page Contains    User Login
    Input Text    name:email   ${username}

Input Password
    [Arguments]    ${password}
    Input Text    name:password    ${password}

Submit Credentials
    Click Element    xpath://button[@type='submit']

Sucessfull Login message
    Wait Until Page Contains    Welcome to GoLD Project
    Page Should Contain    Welcome to GoLD Project

Go to Users
    Click Element    xpath://a[@href='/users']
    Wait Until Page Contains    Load More

Add Users With All Fields Empty
   Click Element    xpath://button[starts-with(text(),'Add')]
   Click Element    xpath://button[normalize-space()='Save']
   Page Should Contain    This is a required field

Add Users with email field empty
   Click Element    xpath://button[starts-with(text(),'Add')]
   Input Text    xpath:(//input[@id='firstName'])[2]   ${firstnamefield}
   Input Text    xpath:(//input[@id='lastName'])[2]    ${lastnamefield}
   Input Text    xpath:(//input[@id='dob'])[1]    ${dob}
   Click Element    xpath:(//div[@id='gender'])[1]
   Click Element    xpath://li[normalize-space()='Male']
   Input Text    xpath:(//input[@id='dob'])[1]  ${gender}
   Input Text    xpath:(//input[@id='phone'])[2]   ${phone}
   Click Element    xpath://button[normalize-space()='Save']
   Page Should Contain  This is a required field

Add Users With Firstname Field Empty
   Click Element    xpath://button[starts-with(text(),'Add')]
   Input Text    xpath:(//input[@id='lastName'])[2]    ${lastnamefield}
   Input Text    xpath:(//input[@id='dob'])[1]    ${dob}
   Click Element    xpath:(//div[@id='gender'])[1]
   Click Element    xpath://li[normalize-space()='Male']
   Input Text    xpath:(//input[@id='dob'])[1]  ${gender}
   Input Text    xpath:(//input[@id='email'])[2]   ${emailfield}
   Input Text    xpath:(//input[@id='phone'])[2]   ${phone}
   Click Element    xpath://button[normalize-space()='Save']
   Page Should Contain  This is a required field

Add Users With lastname Field Empty
   Click Element    xpath://button[starts-with(text(),'Add')]
   Input Text    xpath:(//input[@id='firstName'])[2]   ${firstnamefield}
   Input Text    xpath:(//input[@id='dob'])[1]    ${dob}
   Click Element    xpath:(//div[@id='gender'])[1]
   Click Element    xpath://li[normalize-space()='Male']
   Input Text    xpath:(//input[@id='dob'])[1]  ${gender}
   Input Text    xpath:(//input[@id='email'])[2]   ${emailfield}
   Input Text    xpath:(//input[@id='phone'])[2]   ${phone}
   Click Element    xpath://button[normalize-space()='Save']

Add Users With Phone Field Empty
   Click Element    xpath://button[starts-with(text(),'Add')]
   Input Text    xpath:(//input[@id='firstName'])[2]   ${firstnamefield}
   Input Text    xpath:(//input[@id='lastName'])[2]    ${lastnamefield}
   Input Text    xpath:(//input[@id='dob'])[1]    ${dob}
   Click Element    xpath:(//div[@id='gender'])[1]
   Click Element    xpath://li[normalize-space()='Male']
   Input Text    xpath:(//input[@id='dob'])[1]  ${gender}
   Input Text    xpath:(//input[@id='email'])[2]   ${emailfield}
   Click Element    xpath://button[normalize-space()='Save']

Add Users With All Fields Valid
    [Arguments]    ${firstname}     ${lastname}     ${email}
   Click Element    xpath://button[starts-with(text(),'Add')]
   Input Text    xpath:(//input[@id='firstName'])[2]   ${firstname}
   Input Text    xpath:(//input[@id='lastName'])[2]    ${lastname}
   Input Text    xpath:(//input[@id='dob'])[1]    ${dob}
   Click Element    xpath:(//div[@id='gender'])[1]
   Click Element    xpath://li[normalize-space()='Male']
   Input Text    xpath:(//input[@id='dob'])[1]  ${gender}
   Input Text    xpath:(//input[@id='email'])[2]   ${email}
   Input Text    xpath:(//input[@id='phone'])[2]   ${phone}
   Click Element    xpath://button[normalize-space()='Save']

Search the fields
    [Arguments]    ${firstname}     ${email}
    Input Text    xpath://input[@id='search-input']     ${firstname}
    Wait Until Page Contains    Total Results:
    Page Should Contain    Total Results:

Edit User
    [Arguments]    ${updatedFirstName}      ${updatedLastName}
    Click Element    xpath://button[@aria-label='popover-trigger-button']
    Click Element    xpath://span[normalize-space()='Edit']
    Sleep    3
    Input Text    xpath:(//input[@id='firstName'])[2]   ${updatedFirstName}
    Input Text    xpath:(//input[@id='lastName'])[2]    ${updatedLastName}
    Click Element    xpath:(//button[normalize-space()='Update'])[1]
    Page Should Contain    User added successfully
    Wait Until Page Contains    ${updatedFirstName}
    Page Should Contain    ${updatedFirstName}


Delete User
    Click Element    xpath://button[@aria-label='popover-trigger-button']
    Click Element    xpath://span[normalize-space()='Delete']
    Page Should Contain    Delete User
    Click Element    xpath:(//button[normalize-space()='Confirm'])[1]
    Wait Until Page Contains    User deleted successfully
    Page Should Contain    User deleted successfully
