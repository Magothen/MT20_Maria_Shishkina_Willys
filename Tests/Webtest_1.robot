*** Settings ***
Documentation           This is some basic info about the whole test suite  #info om hela testet
Library                 SeleniumLibrary

*** Test Cases ***
User can access website     #testfallets titel
    [Documentation]             This is some basic info about the test suite  #info om just detta testfallet
    [Tags]                      Test 1  #klassifiering av testet
    Open browser                about:blank     chrome  #minst 2 mellanslag. Man skriver vilken browser den ska använda
    Go to                       http://www.willys.se/   #skriv hemsidan
    wait until page contains    Handla billig mat online  #det ska komma upp
    Close Browser
