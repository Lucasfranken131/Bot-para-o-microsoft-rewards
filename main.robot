*** Settings ***
Documentation    roboto
Library    SeleniumLibrary
Library    String
Suite Setup    Abre navegador

*** Variables ***
${Browser} =    Chrome
${Page} =     https://www.bing.com/
${Login} =    "Your email"
${Password} =    "Your password"
${Counter} =    0

*** Tasks ***
Rodar teste
    Login
    Search

*** Keywords ***
Abre navegador
    Create Webdriver    ${Browser}      
    Go To    ${Page}
    Maximize Browser Window
    Set Selenium Speed    2 second  

Login
    Click Element    id:id_s
    Input Text    id:i0116    ${Login}
    Click Element    id:idSIButton9
    Input Password    id:i0118    ${Password}
    Click Element    id:idSIButton9
    Click Element    id:idBtn_Back

Search  
    Click Button    id:bnp_btn_reject
    Input Text    id:sb_form_q    Sou um robô
    Click Element    id:search_icon
    FOR    ${Counter}    IN RANGE    30
        ${Search} =    Generate Random String    3-10
        Input Text    id:sb_form_q    ${Search}
        Click Element    id:sb_form_go
        Log    ${Search}
    END
    Log    Funcionou