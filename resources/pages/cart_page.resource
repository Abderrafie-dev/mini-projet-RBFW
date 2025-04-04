# resources/pages/cart_page.resource
*** Settings ***
Resource    base_page.resource

*** Variables ***
${PRODUCT_IN_CART_PREFIX}    xpath=//table[@ng-show='cart.productsInCart.length > 0']//span[contains(text(), '
${PRODUCT_IN_CART_SUFFIX}    ')]
${REMOVE_BUTTON}             css=a.remove
${CHECKOUT_BUTTON}           id=checkOutButton
${CHECKOUT_BUTTON_TEXT}      xpath=//*[@id="checkOutButton"]

*** Keywords ***
Verify Product In Cart
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON_TEXT}
    Element Should Be Visible    ${CHECKOUT_BUTTON_TEXT}