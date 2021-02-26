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
    ${link_text}                Get Title
    Should Be Equal             ${link_text}    Handla billig mat online | Willys

SEARCH FOR PRODUCT
    [Arguments]                 ${search_term}
    Enter Search Term           ${search_term}
    Submit Search
    Verify Search Completed     ${search_term}
Enter Search Term
    [Arguments]                 ${search_term}
    #man högerklickar i sökfältet-> inspektera-> dubbelklicka i den nya fönstret på id och kopiera det id:t
    input text                  id:selenium--search-items-input     ${search_term}  #en local variabel som pekar på vad vi ska söka (finns definierad på första sidan)
Submit Search
    #man högerklickar i sökfältet-> inspektera-> på det markerade fältet: högerklicka-> copy -> copy xpath
    #då simulerar man att den trycker på knappen Enter
    press keys                  xpath://*[@id="selenium--search-items-input"]   RETURN
Verify Search Completed
    [Arguments]                 ${search_term}
    wait until page contains element    xpath://*[@id="selenium--product-grid-header"]  ## man ställer sig på texten som kommer upp t.ex. "Sökord: kiwi"
    #OBS! "wait until page contains" söker på ett vanligt ord
    #OBS! "wait until page contains elements" söker på xpaths
    ${actual_term}              Get Text    xpath://*[@id="selenium--product-grid-header"]
    Should be equal             "Sökord: ${search_term}"  "${actual_term}"

END WEB TEST
        Close Browser

*** Test Cases ***
User can access website     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 8A  #klassifiering av testet
    GO TO WEB PAGE

User can search for a product     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 8B  #klassifiering av testet
    GO TO WEB PAGE
    SEARCH FOR PRODUCT          kiwi    #Sökord: kiwi - försvinner nu

User can search for another product     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 8C  #klassifiering av testet
    GO TO WEB PAGE
    SEARCH FOR PRODUCT         hundgodis    #Sökord: hundgodis - försvinner nu