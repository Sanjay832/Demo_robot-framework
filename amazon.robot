*** Settings ***
Library        SeleniumLibrary
# Resource        resource.robot

*** Variables ***
*** Test Cases ***
Open amazon website
    open browser with amazon url
get list of shoes in page
    search for shoes
    get list of shoes
*** Keywords ***
open browser with amazon url
    Create Webdriver    Chrome
    Go To        https://www.amazon.in/?tag=googmantxtmob170-21&ascsubtag=_k_Cj0KCQjwmOm3BhC8ARIsAOSbapXxew3FcSJoNxj0VbN6xP09oeVC3ch69zkFtawziFBgBmWLe1f2gr4aAr5xEALw_wcB_k_
search for shoes
    Input Text    id:twotabsearchtextbox    shoes
    Click Button    id:nav-search-submit-button
get list of shoes
    @{elements} =    Get WebElements    css:span[class='a-size-base-plus a-color-base a-text-normal']
    ${count}=    Set Variable    1
    FOR  ${element}  IN  @{elements}
        ${text}=     Get Text    ${element}
        Log    ${element.text}
        Sleep    3s
        Exit For Loop If    '${count}'=='4'
        ${count}=    Evaluate    ${count}+1
    END
    