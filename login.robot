*** Settings ***
Library           Selenium2Library
Suite Setup        Open Browser    ${loginPage}
Test Setup        GotoLoginPage
#Suite Teardown     Close Browser
#Resource          Resource.robot

*** Variables ***
${loginPage}    https://sprint3r2.wordpress.com/
${username}    user_login
${password}    user_pass
${remembermeCheckbox}    rememberme
${LoginButton}    wp-submit
${LinkLogin}    xpath=//*[@id="meta-2"]/ul/li[2]/a
${HambergerMenu}    css=button.menu-toggle
${ValidUsername}    sprint3r2
${ValidPassword}    WorkingSoftware

*** Test Cases ***
Test Login Success
    Fill Username and Password    ${ValidUsername}    ${ValidPassword}
    UnCheck Remember Me
    Click Login
    Check wording after login success

Test Login Fail duto no username or password
    Fill Username and Password    ${EMPTY}    ${EMPTY}
    UnCheck Remember Me
    Click Login
    Checkbox Should Be Selected    ${remembermeCheckbox}

Login Fail
    [Template]   Invalid Test Fail
     ${ValidUsername}    123456    ERROR: The password you entered for the email or username ${ValidUsername} is incorrect.
      sprint3r123    ${ValidPassword}    ERROR: Invalid email or username.
      sprint3r123    ${EMPTY}    ERROR: The password field is empty.
      ${EMPTY}    ${ValidPassword}    ERROR: The email or username field is empty.
*** Keywords ***
GotoLoginPage
    Go to   ${loginPage}
    Click Element   ${HambergerMenu}
    Wait Until Element Is Visible      ${LinkLogin}
    Click Element      ${LinkLogin}
Fill Username and Password
    [arguments]     ${UsernameInput}    ${PasswordInput}
    Input Text    ${username}    ${UsernameInput}
    Input Text    ${password}     ${PasswordInput}
UnCheck Remember Me
    Click Element     ${remembermeCheckbox}
Click Login
    Click Element     ${LoginButton}
Check wording after login success
    Page Should Contain     Welcome to WordPress.com!
Check wording after login fail
    [arguments]    ${ErrorLoginFail}
    Page Should Contain    ${ErrorLoginFail}
Invalid Test Fail
    [arguments]    ${UsernameInput}    ${PasswordInput}     ${ErrorLoginFail}
    Fill Username and Password    ${UsernameInput}    ${PasswordInput}
    UnCheck Remember Me
    Click Login
    Check wording after login fail    ${ErrorLoginFail}
