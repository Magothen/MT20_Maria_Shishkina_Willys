*** Settings ***
Documentation           This is some basic info about the whole test suite  #info om hela testet. OBS! VI INFÖR GLOBALA VARIABLER
#OBS! "wait until page contains" söker på ett vanligt ord
#OBS! "wait until page contains elements" söker på xpaths
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST  #test börjar med att man öppnar en websida
Test Teardown           END WEB TEST  #test slutar med att man stänger en websida

#OBS! VI INFÖR GLOBALA VARIABLER (STORA BOKSTÄVER)
*** Variables ***
${BROWSER}          chrome
${URL}              http://www.willys.se/
${SEARCH_TERM}      kiwi

*** Keywords ***
BEGIN WEB TEST
    Open browser                about:blank     ${BROWSER}  #minst 2 mellanslag. BROWSER (som är nu variabel) hänvisar till vilken browser den ska använda

GO TO WEB PAGE
    Load Page                   #vi inför en extra underrubrik
    Verify Page Loaded          #vi inför en extra underrubrik
Load Page
    Go to                       ${URL}   #URL (som är nu variabel) hänvisar till hemsidan
Verify Page Loaded
    wait until page contains    Handla billig mat online  #det ska komma upp
    #OBS! "wait until page contains" söker på ett vanligt ord
    #OBS! "wait until page contains elements" söker på xpaths

SEARCH FOR PRODUCT
    [Arguments]                 ${search_term}  ${search_result}
    Enter Search Term           ${search_term}
    Submit Search
    Verify Search Completed     ${search_result}
Enter Search Term
    [Arguments]                 ${search_term}
    #man högerklickar i sökfältet-> inspektera-> dubbelklicka i den nya fönstret på id och kopiera det
    input text                  id:selenium--search-items-input     ${search_term}  #en local variabel som pekar på vad vi ska söka (finns definierad på första sidan)
Submit Search
    #man högerklickar i sökfältet-> inspektera-> på det markerade fältet: högerklicka-> copy -> copy xpath
    #då simulerar man att den trycker på knappen Enter
    press keys                  xpath://*[@id="selenium--search-items-input"]   RETURN
Verify Search Completed
    [Arguments]                 ${search_result}
    #man väntar tills den ser att hemsidan har ger resultat med Sökord: kiwi (eller något annat man söker, ska finnas ovanför alla resultat)
    wait until page contains    ${search_result}  ##en local variabel som pekar på vad vi ska söka (finns definierad på första sidan)
    #OBS! "wait until page contains" söker på ett vanligt ord
    #OBS! "wait until page contains elements" söker på xpaths

END WEB TEST
        Close Browser

*** Test Cases ***
User can access website     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 7A  #klassifiering av testet
    GO TO WEB PAGE

User can search for a product     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 7B  #klassifiering av testet
    GO TO WEB PAGE
    SEARCH FOR PRODUCT          kiwi    Sökord: kiwi

User can search for a product     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 7C  #klassifiering av testet
    GO TO WEB PAGE
    SEARCH FOR PRODUCT         hundgodis    Sökord: hundgodis