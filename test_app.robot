*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Keywords ***
Is Prime
    [Arguments]    ${X}
    ${response}=    GET    http://localhost:9080/is_prime/${x}    expected_status=any
    RETURN    ${response}

*** Test Cases ***
Test True When X Is 17
    ${response}=    Is Prime    17
    Status Should Be    200
    ${result}=    Set Variable    ${response.json()['result']}
    Should Be Equal    ${result}    ${True}

False When X Is 36
    ${response}=    Is Prime    36
    Status Should Be   200
    ${result}=    Set Variable    ${response.json()['result']}
    Should Be Equal    ${result}    ${False}

True Whn X Is 13219
    ${response}=    Is Prime    13219
    Status Should Be    200
    ${result}=    Set Variable    ${response.json()['result']}
    Should Be Equal    ${result}    ${True}