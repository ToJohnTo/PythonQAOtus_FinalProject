*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${locator_username}         id:input-username
${locator_password}         id:input-password
${locator_submit_button}    css:.btn.btn-primary
${locator_logout_button}    css:.fa.fa-sign-out
#${locator_logout_button}    /html/body/div[1]/header/div/ul/li[2]/a/i


*** Keywords ***
Set password
    [Arguments]  ${PASSWORD}
    Input Password      ${locator_password}     ${PASSWORD}


Verify Page Title Contains
    [Arguments]    ${VALUE}
    ${TITLE}    Get Title
    Should Contain      ${TITLE}    ${VALUE}


Logout
    Wait until keyword succeeds   3sec   1sec   Click Element    ${locator_logout_button}