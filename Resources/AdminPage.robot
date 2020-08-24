*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${admin_page}               https://spb.hh.ru/
${locator_menu_button}      css:.supernova-navi-item.supernova-navi-item_lvl-2.HH-Supernova-NaviLevel2-Item
#${locator_username}         id:input-username
#${locator_password}         id:input-password
#${locator_submit_button}    css:.btn.btn-primary
${locator_logout_button}    css:input[value="Выход"]


*** Keywords ***
Go to Admin page
    [Arguments]     ${BROWSER}
    Open Browser    ${admin_page}    ${BROWSER}


Verify Admin Page
    ${url}=   Get Location
    Wait until keyword succeeds   3sec   1sec   should be equal   ${url}   ${admin_page}


Logout
    Wait until keyword succeeds   3sec   1sec   Click Element    ${locator_menu_button}
    Sleep   10
    Wait until keyword succeeds   3sec   1sec   Click Element    ${locator_logout_button}
    Sleep   10