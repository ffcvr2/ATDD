*** Settings ***
Library           Selenium2Library
Suite Setup        Open Browser    ${loginPage}
Test Setup        GotoLoginPage

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
    Click Login
    Check wording after login success

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
Click Login
    Click Element     ${LoginButton}
Check wording after login success
    Page Should Contain     Welcome to WordPress.com!
