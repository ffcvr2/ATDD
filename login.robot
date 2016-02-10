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

  #Click Link
