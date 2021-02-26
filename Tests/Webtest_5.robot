*** Settings ***
Documentation           This is some basic info about the whole test suite  #info om hela testet
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST  #test börjar med att man öppnar en websida
Test Teardown           END WEB TEST  #test slutar med att man stänger en websida

*** Keywords ***
BEGIN WEB TEST
    Open browser                about:blank     chrome  #minst 2 mellanslag. Man skriver vilken browser den ska använda

GO TO WEB PAGE
    Load Page                   #vi inför en extra underrubrik
    Verify Page Loaded          #vi inför en extra underrubrik
Load Page
    Go to                       http://www.willys.se/   #skriv hemsidan
Verify Page Loaded
    wait until page contains    Handla billig mat online  #det ska komma upp

SEARCH FOR PRODUCT
    Enter Search Term           #vi inför en extra underrubrik
    Submit Search               #vi inför en extra underrubrik
    Verify Search Completed     #vi inför en extra underrubrik
Enter Search Term
    #man högerklickar i sökfältet-> inspektera-> dubbelklicka i den nya fönstret på id och kopiera det
    #då simulererar man att den ställer sig i den rutan och skriver "kiwi"  #OBS! minst 2 mellanslag till kiwi
    input text                  id:selenium--search-items-input     kiwi
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
    [Tags]                      Test 5A  #klassifiering av testet
    #BEGIN WEB TEST  #flyttats till Settings
    GO TO WEB PAGE

User can search for a product     #testfallets titel
    [Documentation]             This is some basic info about the test  #info om just detta testfallet
    [Tags]                      Test 5B  #klassifiering av testet
    GO TO WEB PAGE
    SEARCH FOR PRODUCT
    #END WEB TEST  #flyttats till Settings