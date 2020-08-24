*** Settings ***
Library         SeleniumLibrary     #run_on_failure=None
Resource        ../Resources/LoginPage.robot
Resource        ../Resources/AdminPage.robot
Documentation   Это финальный проект с тестами, написанными с помощью Robot Framework


*** Variables ***
# C переменными уже можно работать через опцию -v
${BROWSER}    chrome


*** Test Cases ***
#Check test login
#    [Setup]     LoginPage.Go to login page    ${BROWSER}
#    LoginPage.Login
#    ...     USERNAME=otus_final_project@mail.ru
#    ...     PASSWORD=Otus25082020
#    AdminPage.Verify Admin Page
#    [Teardown]  Close Browser
#
#
#Check test negative login without pass and login
#    [Setup]     LoginPage.Go to login page    ${BROWSER}
#    LoginPage.Login
#    ...     USERNAME=
#    ...     PASSWORD=
#    LoginPage.Verify Login Page
#    [Teardown]  Close Browser
#
#
#Check test negative login without pass
#    [Setup]     LoginPage.Go to login page    ${BROWSER}
#    LoginPage.Login
#    ...     USERNAME=otus_final_project@mail.ru
#    ...     PASSWORD=
#    LoginPage.Verify Login Page
#    [Teardown]  Close Browser
#
#
#Check test negative login without login
#    [Setup]     LoginPage.Go to login page    ${BROWSER}
#    LoginPage.Login
#    ...     USERNAME=
#    ...     PASSWORD=Otus25082020
#    LoginPage.Verify Login Page
#    [Teardown]  Close Browser


Check test unlogin
    [Documentation]  Check unlogin
    [Setup]     LoginPage.Go to login page    ${BROWSER}
    LoginPage.Login
    ...     USERNAME=otus_final_project@mail.ru
    ...     PASSWORD=Otus25082020
    AdminPage.Verify Admin Page
    AdminPage.Logout
    LoginPage.Verify Login Page
    [Teardown]  Close Browser


###########################################################################

#
#Check test elements by css selector
#    [Setup]     Open Browser    ${WEB_PATH}    ${BROWSER}
#    Wait until keyword succeeds   3sec   1sec   Click Element	css:.btn-group.btn-block
#    Create Session  session1  https://spb.hh.ru/  verify=${False}  cookies=${DICT_COOKIE}
#    [Teardown]  Close Browser
#
#
#Check test element by class name selector
#    [Setup]     Open Browser    ${WEB_PATH}    ${BROWSER}
#    Wait until keyword succeeds   3sec   1sec   Click Element	class:btn-group.btn-block
#    [Teardown]  Close Browser
#
#
#Check test login
#    [Documentation]  Check login
#    [Setup]     Open Browser    ${WEB_ADMIN_PATH}    ${BROWSER}
#    Login    demo    demo
#    Verify Page Title Contains   Dashboard
#    [Teardown]  Close Browser
#
#
#Check test unlogin
#    [Documentation]  Check unlogin
#    [Setup]     Open Browser    ${WEB_ADMIN_PATH}    ${BROWSER}
#    Login    demo    demo
#    Logout
#    Verify Page Title Contains   Administration
#    [Teardown]  Close Browser
