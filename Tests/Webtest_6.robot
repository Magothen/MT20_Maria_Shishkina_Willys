*** Settings ***
Documentation           This is some basic info about the whole test suite  #info om hela testet. OBS! VI INFÖR GLOBALA VARIABLER
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

SEARCH FOR PRODUCT
    Enter Search Term           #vi inför en extra underrubrik
    Submit Search               #vi inför en extra underrubrik
    Verify Search Completed     #vi inför en extra underrubrik
Enter Search Term
    #man högerklickar i sökfältet-> inspektera-> dubbelklicka i den nya fönstret på id och kopiera det
    #då simulererar man att den ställer sig i den rutan och skriver "kiwi"  #OBS! minst 2 mellanslag till kiwi
    input text                  id:selenium--search-items-input     ${SEARCH_TERM}  #SEARCH_TERM (som är nu variabel) pekar på sökordet
Submit Search
    #man högerklickar i sökfältet-> inspektera-> på det markerade fältet: högerklicka-> copy -> copy xpath
    #då simulerar man att den trycker på knappen Enter
    press keys                  xpath://*[@id="selenium--search-items-input"]   RETURN
Verify Search Completed
    #man väntar tills den ser att hemsidan har ger resultat med Sökord: kiwi (ovanför alla resultat)
    wait until page contains    Sökord: kiwi

END WEB TEST
        Close Browser

*** Test Cases ***
User can access website     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 6A  #klassifiering av testet
    GO TO WEB PAGE

User can search for a product     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 6B  #klassifiering av testet
    GO TO WEB PAGE
    SEARCH FOR PRODUCT
