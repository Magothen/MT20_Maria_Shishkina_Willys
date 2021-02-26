*** Settings ***
Documentation           This is some basic info about the whole test suite  #info om hela testet
Library                 SeleniumLibrary

*** Test Cases ***
User can access website and search for a product     #testfallets titel
    [Documentation]             This is some basic info about the test suite  #info om just detta testfallet
    [Tags]                      Test 2  #klassifiering av testet
    Open browser                about:blank     chrome  #minst 2 mellanslag. Man skriver vilken browser den ska använda
    Go to                       http://www.willys.se/   #skriv hemsidan
    wait until page contains    Handla billig mat online  #det ska komma upp

    #man högerklickar i sökfältet-> inspektera-> dubbelklicka i den nya fönstret på id och kopiera det
    #då simulererar man att den ställer sig i den rutan och skriver "kiwi"  #OBS! minst 2 mellanslag till kiwi
    input text                  id:selenium--search-items-input     kiwi

    #man högerklickar i sökfältet-> inspektera-> på det markerade fältet: högerklicka-> copy -> copy xpath
    #då simulerar man att den trycker på knappen Enter
    press keys                  xpath://*[@id="selenium--search-items-input"]   RETURN

    #man väntar tills den ser att hemsidan har ger resultat med Sökord: kiwi (ovanför alla resultat)
    wait until page contains    Sökord: kiwi
    Close Browser