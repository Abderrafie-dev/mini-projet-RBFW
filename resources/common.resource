# resources/common.resource
*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    DateTime

*** Variables ***
${BROWSER}         chrome
${HEADLESS}        ${FALSE}
${TIMEOUT}         30s
${BASE_URL}        https://advantageonlineshopping.com/#/
${SCREENSHOTS_DIR}    ${CURDIR}/../screenshots

*** Keywords ***
Open AOS Website
    # Create screenshots directory if it doesn't exist
    Create Directory    ${SCREENSHOTS_DIR}
    
    # Set options with longer timeouts and disable GPU for stable testing
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Run Keyword If    ${HEADLESS} == ${TRUE}    Evaluate    $options.add_argument('--headless')
    Evaluate    $options.add_argument('--disable-gpu')
    Evaluate    $options.add_argument('--no-sandbox')
    Evaluate    $options.add_argument('--disable-dev-shm-usage')
    
    # Open browser with updated options
    Open Browser    ${BASE_URL}    ${BROWSER}    options=${options}
    Set Window Size    1920    1080
    Set Selenium Timeout    ${TIMEOUT}
    
    # Wait for site to load with updated selectors
    Wait Until Page Contains Element    xpath=//*[@id="laptopsImg"]    timeout=30s
    Wait For Condition    return document.readyState == "complete"    timeout=30s
    
    # Take screenshot of homepage
    Take Screenshot With Label    homepage_loaded
    

Take Screenshot With Label
    [Arguments]    ${label}
    ${timestamp}=    Get Current Date    result_format=%Y%m%d-%H%M%S
    ${filename}=    Set Variable    ${SCREENSHOTS_DIR}/${timestamp}_${label}.png
    Capture Page Screenshot    ${filename}
    Log    Screenshot saved to ${filename}    console=True