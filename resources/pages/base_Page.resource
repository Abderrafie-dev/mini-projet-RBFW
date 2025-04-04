# resources/pages/base_page.resource
*** Settings ***
Resource    ../common.resource

*** Variables ***
${CART_ICON}       id=shoppingCartLink

*** Keywords ***
Wait Until Page Is Loaded
    Wait For Condition    return document.readyState == "complete"
    
Click Element When Ready
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Element    ${locator}

Open Cart
    Click Element When Ready    ${CART_ICON}