*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Dialogs


*** Variables ***
${login_page}               https://spb.hh.ru/account/login
${locator_username}         css:input[type=text]
${locator_password}         css:input[type=password]
${locator_submit_button}    css:button[type=submit]     #.bloko-button.bloko-button_primary.bloko-button_stretched
#${locator_logout_button}    css:.fa.fa-sign-out


*** Keywords ***
Go to login page
    [Arguments]     ${BROWSER}
    Open Browser    ${login_page}    ${BROWSER}   options=add_argument("--ignore-certificate-errors")


Login
    [Arguments]   ${USERNAME}   ${PASSWORD}
    Set username  ${USERNAME}
    Set password  ${PASSWORD}
    Wait until keyword succeeds   3sec   1sec   Click Element    ${locator_submit_button}
    Pause Execution    Please Press OK to Continue.


Return login cookie
    ${cookie_value}=  Get Cookie   JSESSIONID
    ${DICT_COOKIE}=  Create Dictionary   JSESSIONID=${cookie_value}
    [Return]  ${DICT_COOKIE}



Set username
    [Arguments]  ${NAME}
    Clear Element Text  ${locator_username}
    Input Text          ${locator_username}     ${NAME}


Set password
    [Arguments]  ${PASSWORD}
    Input Password      ${locator_password}     ${PASSWORD}


Verify Login Page
    ${url}=   Get Location
    should be equal   ${url}   ${login_page}
