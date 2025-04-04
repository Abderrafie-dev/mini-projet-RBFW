# tests/keywords/add_to_cart_keywords.robot
*** Settings ***
Resource    ../../resources/pages/home_page.resource
Resource    ../../resources/pages/product_page.resource
Resource    ../../resources/pages/cart_page.resource

*** Keywords ***
Add Product To Cart From Data
    [Arguments]    ${product_data}
    Navigate To Category    ${product_data}[category]
    Take Screenshot With Label    category_${product_data}[category]
    

    Select First Product
    Take Screenshot With Label    product_${product_data}[name]
    
    Select Product Color    ${product_data}[color]
    Take Screenshot With Label    color_selected_${product_data}[color]
    
    Set Product Quantity    ${product_data}[quantity]
    Take Screenshot With Label    quantity_set_${product_data}[quantity]
    
    Add Product To Cart
    Take Screenshot With Label    product_added_to_cart

Verify Product Was Added To Cart
    [Arguments]    ${product_data}
    Open Cart
    Verify Product In Cart    
    Take Screenshot With Label    product_verified_in_cart_${product_data}[name]