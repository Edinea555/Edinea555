*** Settings ***

Library           SeleniumLibrary
Library           Collections


*** Variables ***
${SERVER}  www.linx.com.br       
${BROWSER}        Chrome
${DELAY}          0
${LOGIN URL}      http://${SERVER}/
${MENU}          //ul[@class='m-list m-menu']//*[contains(text(),'@{MenuItem}')]
@{MenuItem}      segmentos  soluções para  soluções de  institucional  área do cliente  blog 
${HOME}          //div[@class='o-header_logo']
${FILTRO_INS_CARREIRA}      //select[@id='greenouse-segments']
${TITULO_FILTRO}            //p[@class='a-title o-work-with-us_subtitle']



*** Keywords ***
Acesso ao Site Linx
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
  

 Acessar Menu
  [Arguments]   ${MENUITEM} 
  ...           ${ITEM}  
                
   Click Element                  //ul[@class='m-list m-menu']//*[contains(text(),'${MENUITEM}')] 
   Wait Until Element Is Visible  //li[@class='m-list_item']//*[contains(text(), '${ITEM}')]
   Click Element                  //li[@class='m-list_item']//*[contains(text(), '${ITEM}')]

filal deverá ser visivel em tela
  [Arguments]   ${FILIAL}
  Wait Until Page Contains Element   //address[@class='c-address-list__item o-box o-box--gray']//*[contains(text(),'${FILIAL}')]

filal não deverá ser visivel em tela
  [Arguments]                       ${FILIAL}
  Wait Until Page Does Not Contain Element   //address[@class='c-address-list__item o-box o-box--gray']//*[contains(text(),'${FILIAL}')]  

Retornar a tela inicial
  Click Element                       ${HOME}    

Filtrar segmento em Carreira Linx
  [Arguments]                        ${SEGMENTO[1]}      
  ...                                ${SEGMENTO[2]}
  Click Element                      ${FILTRO_INS_CARREIRA}
  Select From List By Label          greenouse-segments         ${SEGMENTO[1]}
  Select From List By Label          greenouse-segments         ${SEGMENTO[2]}
  Page Should Contain Element        ${TITULO_FILTRO}           ${SEGMENTO[2]}


