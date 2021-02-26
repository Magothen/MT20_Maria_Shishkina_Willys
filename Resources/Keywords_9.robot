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
    #man högerklickar i sökfältet-> inspektera-> dubbelklicka i den nya fönstret på id och kopiera det
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

