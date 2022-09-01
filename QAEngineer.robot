***Settings***
Documentation  This is Technical Test QA Engineer, Automation Script.
Library        SeleniumLibrary
Library        DebugLibrary
Library        BuiltIn
Test Setup     Open Browser and Go TO URL
Test Teardown  Capture Failed and Close All Browsers
Default Tags   Positive

***Keywords****
Open Browser and Go TO URL
    Open Browser    https://react-shopping-cart-67954.firebaseapp.com/    Chrome

Capture Page If Test Failed
    Run Keyword If Test Failed            Capture Page Screenshot
    Run Keyword If Test Failed            Capture Current Location

Capture Failed and Close All Browsers
    Capture Page If Test Failed
    Close All Browsers

Verify Page is Loaded
    Wait Until Element is Visible   xpath=//main[contains(@class, "sc-ebmerl-3")]  timeout= 3  
    Wait Until Element is Visible   xpath=//div[contains(@class, "sc-uhudcz-0")]//child::button  timeout= 3

Get Random Index Product
    ${product}=   Get Element Count  xpath=//div[contains(@class, "sc-uhudcz-0")]//child::button
    ${index}=   Evaluate      random.randint(1,${product})       modules=random
    [Return]   ${index}

Click Add to Cart
    [Arguments]    ${index}
    Click Element  xpath=(//div[contains(@class, "sc-uhudcz-0")]//child::button)[${index}]

Verify Checkout Window
    Wait Until Element is Visible   xpath=//div[contains(@class, "sc-1h98xa9-4")]  timeout= 3 
    Wait Until Element is Visible   xpath=//div[contains(@class,"sc-1h98xa9-2")]//child::div[text()="1"]   timeout= 3
    Wait Until Element is Visible   xpath=//p[contains(@class, "sc-11uohgb-3")][text()="1"]   timeout=3

Click Checkout button
    Click Element   xpath=//button[contains(@class, "sc-1h98xa9-11")][text()="Checkout"]

Verify Size Filter
    Wait Until Element is Visible   xpath=//div[contains(@class, "sc-bj2vay-0")]  timeout=3

Get Random Index Size Filter
    ${sizeFilter}=    Get Element Count   xpath=//div[contains(@class, "sc-bj2vay-1")]
    Should Be Equal As Integers  ${sizeFilter}    7
    ${index}=   Evaluate      random.randint(1,${sizeFilter})       modules=random
    [Return]  ${index}

Click Size Filter
    [Arguments]  ${index}
    Click Element  xpath=(//div[contains(@class, "sc-bj2vay-1")])[${index}]

Verify Size Filter Result
    ${product}=   Get Element Count  xpath=//div[contains(@class, "sc-uhudcz-0")]//child::div
    Should Not Be Equal As Integers   ${product}   16

Click Add More Quantity of Product
    Click Element   xpath=//button[contains(@class, "sc-11uohgb-6")][text()="+"]

Verify Quantity Product After Add More
    Wait Until Element is Visible   xpath=//p[contains(@class, "sc-11uohgb-3")][text()="2"]   timeout=3
    Wait Until Element is Visible   xpath=//div[contains(@class,"sc-1h98xa9-2")]//child::div[text()="2"]  timeout=3 

Click Close button
    Click Element   xpath=//button[contains(@class, "sc-1h98xa9-0")]

Verify Cart Icon Number
    Wait Until Element is Visible   xpath=//div[contains(@class, "sc-1h98xa9-4")]  timeout=3
    Wait Until Element is Visible   xpath=//div[contains(@class,"sc-1h98xa9-2")]//child::div[text()="2"]   timeout=3

Click Decrease Quantity Product button
    Click Element  xpath=//button[contains(@class,"sc-11uohgb-6")][text()="-"]

Verify Quantity After Decrease
    Wait Until Element is Visible  xpath=//p[contains(@class, "sc-11uohgb-3")][text()="1"]   timeout=3

Click Remove Product
    Click Element   xpath=//div[contains(@class, "sc-11uohgb-0")]/child::button

Verify Checkout Window is Empty
    Wait Until Element is Not Visible   xpath=//div[contains(@class, "sc-11uohgb-0")]    timeout=3 

***Test Cases***
Success Checkout Product
#Arrange
    Verify Page is Loaded
    ${index}=   Get Random Index Product
#Act
    Click Add to Cart   ${index}
    Verify Checkout Window
    Click Checkout button
#Assert
    #Should be verified checkout has success

Filter Product by Size
#Arrange
    ${index}=    Get Random Index Size Filter
#Act
    Click Size Filter   ${index}
#Assert
    Verify Page is Loaded
    Verify Size Filter Result

Success Checkout Multiple Quantity Same Product
#Arrange
    Verify Page is Loaded
    ${index}=   Get Random Index Product
#Act
    Click Add to Cart   ${index}
    Verify Checkout Window
    Click Add More Quantity of Product
#Assert
    Verify Quantity Product After Add More
    Click Checkout button
    #Should be verified checkout has success

Success Checkout Multiple Different Product
#Arrange
    Verify Page is Loaded
    ${index}=   Get Random Index Product
#Act
    Click Add to Cart   ${index}
    Verify Checkout Window
    Click Close button
    Get Random Index Product
    Click Add to Cart   ${index}
#Assert
    Verify Cart Icon Number
    Click Checkout button
    #Should be verified checkout has success

Success Decrease Quantity Same Product
#Arrange
    Verify Page is Loaded
    ${index}=   Get Random Index Product
#Act
    Click Add to Cart   ${index}
    Verify Checkout Window
    Click Add More Quantity of Product
    Verify Quantity Product After Add More
    Click Decrease Quantity Product button
#Assert
    Verify Quantity After Decrease

Success Delete Product
#Arrange
    Verify Page is Loaded
    ${index}=   Get Random Index Product
#Act
    Click Add to Cart   ${index}
    Verify Checkout Window
    Click Remove Product
#Assert    
    Verify Checkout Window is Empty
            
