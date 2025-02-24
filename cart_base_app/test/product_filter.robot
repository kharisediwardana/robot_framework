*** Settings ***
resource  ../resources.robot

*** Test Cases ***
Filtering Products by Size
    Given I am on the shopping cart homepage
    When I select a size filter "S"
    Then I should see only products available in the selected size "S"