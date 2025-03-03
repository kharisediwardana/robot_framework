*** Settings ***
resource  ../resources.robot

*** Keywords ***
the product should be in the cart
    Page should contain element  xpath=//div[@class="sc-1h98xa9-1 kQlqIC"]
    Page should contain element  xpath=//div[@class="sc-11uohgb-0 hDmOrM"]
    
the cart count should increase accordingly
    Page should contain element  xpath=//div[@class="sc-1h98xa9-3 VLMSP"][text()="1"]