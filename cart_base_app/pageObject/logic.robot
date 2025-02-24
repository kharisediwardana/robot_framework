*** Settings ***
resource  ../resources.robot

*** Keywords ***
I am on the shopping cart homepage
    Open Browser    ${url}   chrome
    Maximize Browser Window

I view the list of available products
    Wait Until Element is Visible   xpath=//div[@class="sc-uhudcz-0 iZZGui"]

I should see a list of products with names, prices, and images
    # Images
    Page Should Contain Element    xpath=//div[@class='sc-124al1g-1 csvtPz']
    # name
    Page Should Contain Element    xpath=//p[@class='sc-124al1g-4 eeXMBo']
    # Price
    Page Should Contain Element    xpath=//p[@class='sc-124al1g-6 ljgnQL']
    # Size
    Page Should Contain Element    xpath=//p[@class='sc-124al1g-7 kIYxbn']
    # Add to car button
    Page Should Contain Element    xpath=//button[@class='sc-124al1g-0 jCsgpZ']

When I select a size filter "S"
    Wait until element is visible  xpath=//div[@class="sc-bj2vay-0 DCKcC"]
    Click element  xpath=//span[text()= "S"]/parent::label//parent::div


I should see only products available in the selected size "S"
    Page should not contain   xpath=//span[text()= "XS"]
    Page should not contain   xpath=//span[text()= "ML"]
    Page should not contain   xpath=//span[text()= "L"]
    Page should not contain   xpath=//span[text()= "XL"]
    Page should not contain   xpath=//span[text()= "XXL"]