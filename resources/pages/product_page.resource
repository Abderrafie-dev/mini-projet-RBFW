# resources/pages/product_page.resource
*** Settings ***
Resource    base_page.resource

*** Variables ***
${PRODUCT_LIST_ITEM}      xpath=/html/body/div[3]/section/article/div[3]/div/div/div[2]/ul/li[1]
${ADD_TO_CART_BUTTON}     name=save_to_cart
${QUANTITY_INPUT}         name=quantity
${COLOR_OPTION_PREFIX}    css=span[title='
${COLOR_OPTION_SUFFIX}    ']

*** Keywords ***
Select Product
    [Arguments]    ${product_name}
    ${product_locator}=    Set Variable    ${PRODUCT_NAME_PREFIX}${product_name}${PRODUCT_NAME_SUFFIX}
    Click Element When Ready    ${product_locator}
    Wait Until Page Contains Element    ${ADD_TO_CART_BUTTON}
    
Select First Product
    Wait Until Element Is Visible    ${PRODUCT_LIST_ITEM}
    Click Element    ${PRODUCT_LIST_ITEM}
    Wait Until Page Contains Element    ${ADD_TO_CART_BUTTON}

Set Product Quantity
    [Arguments]    ${quantity}
    Input Text    ${QUANTITY_INPUT}    ${quantity}

Select Product Color
    [Arguments]    ${color}
    ${color_locator}=    Set Variable    ${COLOR_OPTION_PREFIX}${color}${COLOR_OPTION_SUFFIX}
    Click Element When Ready    ${color_locator}

Add Product To Cart
    Click Element When Ready    ${ADD_TO_CART_BUTTON}
    # Wait for the cart update animation
    Sleep    1s