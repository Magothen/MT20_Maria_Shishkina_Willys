*** Settings ***
Documentation           This is some basic info about the whole test suite  #info om hela testet. OBS! VI INFÖR GLOBALA VARIABLER
#OBS! "wait until page contains" söker på ett vanligt ord
#OBS! "wait until page contains elements" söker på xpaths
Resource                ../Resources/Keywords_9.robot
Library                 SeleniumLibrary
Suite Setup              BEGIN WEB TEST  #test börjar med att man öppnar en websida
Suite Teardown           END WEB TEST  #test slutar med att man stänger en websida

#OBS! VI INFÖR GLOBALA VARIABLER (STORA BOKSTÄVER)
*** Variables ***
${BROWSER}          chrome
${URL}              http://www.willys.se/
${SEARCH_TERM}      kiwi

*** Test Cases ***
User can access website     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 9A  #klassifiering av testet
    GO TO WEB PAGE

User can search for a product     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 9B  #klassifiering av testet
    GO TO WEB PAGE
    SEARCH FOR PRODUCT          kiwi    #Sökord: kiwi - försvinner nu

User can search for another product     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 9C  #klassifiering av testet
    GO TO WEB PAGE
    SEARCH FOR PRODUCT         hundgodis    #Sökord: hundgodis - försvinner nu