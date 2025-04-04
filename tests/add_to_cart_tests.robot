# tests/add_to_cart_tests.robot
*** Settings ***
Documentation     Tests for adding products to cart on Advantage Online Shopping
Resource          keywords/add_to_cart_keywords.robot
Resource          ../resources/common.resource
Suite Setup       Open AOS Website
Suite Teardown    Close Browser
Test Teardown     Go To    ${BASE_URL}

*** Variables ***
# Product 1 data
${PRODUCT1_CATEGORY}    LAPTOPS
${PRODUCT1_NAME}        HP Chromebook 14 G1(ENERGY STAR)
${PRODUCT1_COLOR}       BLACK
${PRODUCT1_QUANTITY}    1

# Product 2 data
${PRODUCT2_CATEGORY}    SPEAKERS
${PRODUCT2_NAME}        Bose Soundlink Wireless Speaker
${PRODUCT2_COLOR}       WHITE
${PRODUCT2_QUANTITY}    2


*** Test Cases ***
Add Single Product To Cart
    [Documentation]    Test adding a single product to cart
    ${product}=    Create Dictionary    
    ...    category=${PRODUCT1_CATEGORY}    
    ...    name=${PRODUCT1_NAME}    
    ...    color=${PRODUCT1_COLOR}    
    ...    quantity=${PRODUCT1_QUANTITY}
    
    Add Product To Cart From Data    ${product}
    Verify Product Was Added To Cart    ${product}