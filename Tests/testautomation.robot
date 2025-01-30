*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}         Chrome
${URL}            https://explore-ksa.vercel.app/login
${EMAIL}          mona@test.com
${PASSWORD}       12345678
${PHONE}          0536350500  # Phone number

# Locators for Login Elements
${EMAIL_FIELD}     id=email
${PASS_FIELD}      id=password
${LOGIN_BUTTON}    xpath=//button[contains(text(),'Login')]

# Locators for Navigation Bar
${DESTINATIONS_NAV}      xpath=//a[contains(@href, '/Tourist-Destinations')]
${TRANSPORTATION_NAV}    xpath=//a[contains(@href, '/Transportation')]

# Locators for Destination Selection
${DESTINATION_DROPDOWN}    id=destinationSelect
${DESTINATION_OPTION}      xpath=//select[@id='destinationSelect']/option[@value='671be07a6f2861a3bcbd62cf']  # Taif
${DESTINATION_TITLE}       xpath=//h2[contains(text(),'Destination name : Taif')]

# Locators for Transportation Form
${PHONE_FIELD}               name=phone
${TRANSPORTATION_DROPDOWN}    name=typeTransportation
${TRANSPORTATION_OPTION}      xpath=//select[@name='typeTransportation']/option[contains(text(),'Metro')]
${TRANSPORTATION_PROVIDER}    xpath=//p[contains(text(),'Provider: Riyadh Metro')]
${TRANSPORTATION_PRICE}       xpath=//p[contains(text(),'Price:  50 SAR')]
${TRANSPORTATION_SUBMIT}      xpath=//button[contains(text(),'Submit')]

# Locators for Profile Page Navigation
${SETTINGS_BUTTON}       id=settingsDropdown  # Click on dropdown menu
${PROFILE_PAGE}         xpath=//a[contains(@class,'dropdown-item') and contains(@href, '/profile')]
# Locators for Logout
${LOGOUT_BUTTON}         xpath=//button[contains(text(),'Log Out')]
${REVIEWS_NAV}           xpath=//a[contains(@href, '/Reviews-of-Users')]
*** Test Cases ***
Login, Navigate, Select Destination, Enter Phone, Choose Transportation, Handle Alert, and Go to Profile
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${EMAIL_FIELD}    timeout=5s
    Input Text    ${EMAIL_FIELD}    ${EMAIL}
    Input Text    ${PASS_FIELD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Sleep    5s  # Wait for login to complete

    # Navigate to Destinations Page
    Click Element    ${DESTINATIONS_NAV}
    Sleep    3s  # Wait for page to load

    # Select Destination (Taif)
    Wait Until Element Is Visible    ${DESTINATION_DROPDOWN}    timeout=5s
    Select From List By Value    ${DESTINATION_DROPDOWN}    671be07a6f2861a3bcbd62cf  # Select Taif
    Sleep    3s  # Wait for destination details to load

    # Navigate to Transportation Page
    Click Element    ${TRANSPORTATION_NAV}
    Sleep    3s  # Wait for page to load

    # Enter Phone Number
    Wait Until Element Is Visible    ${PHONE_FIELD}    timeout=5s
    Input Text    ${PHONE_FIELD}    ${PHONE}
    Sleep    2s

    # Select Transportation Type (Metro)
    Wait Until Element Is Visible    ${TRANSPORTATION_DROPDOWN}    timeout=5s
    Select From List By Label    ${TRANSPORTATION_DROPDOWN}    Metro
    Sleep    7s

    # Navigate to Reviews Page
    Click Element    ${REVIEWS_NAV}
    Sleep    3s  # Wait for page to load
    # Navigate to Profile Page from Dropdown Menu

    Click Element    ${SETTINGS_BUTTON}  # Open dropdown menu
    Sleep    2s  # Allow dropdown to open
    Click Element    ${PROFILE_PAGE}  # Click on profile page link
    Sleep    4s  # Wait for page to load

    # Logout from the system
    Click Element    ${SETTINGS_BUTTON}
    Click Element    ${SETTINGS_BUTTON}  # Open dropdown menu again
    Sleep    4s  # Allow dropdown to open
    Click Element    ${LOGOUT_BUTTON}  # Click on Log Out
    Sleep    4s  # Wait for logout to complete

    Close Browser
