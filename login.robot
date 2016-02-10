*** Settings ***
Library           Selenium2Library
#Suite Setup        Open Browser    ${loginPage}
#Test Setup        Go to   ${loginPage}
#Suite Teardown     Close Browser
#Resource          Resource.robot
*** Test Cases ***
Test Login Success
  Open Browser    https://sprint3r2.wordpress.com/
  Click Element   css=button.menu-toggle
  Wait Until Element Is Visible      xpath=//*[@id="meta-2"]/ul/li[2]/a
  Click Element      xpath=//*[@id="meta-2"]/ul/li[2]/a

  Input Text    user_login    sprint3r2
  Input Text    user_pass     WorkingSoftware
  Click Element     rememberme
  Click Element     wp-submit
  Page Should Contain     Welcome to WordPress.com!


Test Login Fail due to incorrect password
  Go To    https://sprint3r2.wordpress.com/
  Click Element   css=button.menu-toggle
  Wait Until Element Is Visible      xpath=//*[@id="meta-2"]/ul/li[2]/a
  Click Element      xpath=//*[@id="meta-2"]/ul/li[2]/a

  Input Text    user_login    sprint3r2
  Input Text    user_pass     123456
  Click Element     rememberme
  Click Element     wp-submit
  Page Should Contain     ERROR: The password you entered for the email or username sprint3r2 is incorrect.


Test Login Fail due to incorrect username
    Go To    https://sprint3r2.wordpress.com/
    Click Element   css=button.menu-toggle
    Wait Until Element Is Visible      xpath=//*[@id="meta-2"]/ul/li[2]/a
    Click Element      xpath=//*[@id="meta-2"]/ul/li[2]/a

    Input Text    user_login    sprint3r123
    Input Text    user_pass     WorkingSoftware
    Click Element     rememberme
    Click Element     wp-submit
    Page Should Contain     ERROR: Invalid email or username.
  #Click Link
