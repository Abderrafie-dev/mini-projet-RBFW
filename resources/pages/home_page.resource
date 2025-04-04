# resources/pages/home_page.resource
*** Settings ***
Resource    base_page.resource

*** Variables ***

${CategoryXpath}  //*[@id="laptopsImg"]

*** Keywords ***
Navigate To Category
    [Arguments]    ${category_name}
    Click Element When Ready    xpath=${CategoryXpath}
    Wait Until Page Is Loaded