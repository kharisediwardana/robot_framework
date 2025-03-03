*** Settings ***
resource  ../resources.robot

*** Test Cases ***
Viewing Available Products
    Given I am on the shopping cart homepage 
    When I view the list of available products
    Then I should see a list of products with names, prices, and images

Adding a Product to Cart
    Given I am on the shopping cart homepage
    Debug
    When I add a product to the cart
    Then the product should be in the cart
    And the cart count should increase accordingly

Removing a Product from Cart
    Given I have at least one product in my cart
    When I remove a product from the cart
    Then the product should be removed from the cart
    And the cart count should decrease accordingly

Viewing the Cart
    Given I have added at least one product to the cart
    When I open the cart
    Then I should see the list of added products

Updating Product Quantity in Cart
    Given I have at least one product in my cart
    When I update the quantity of a product in the cart
    Then the total price should update accordingly

Checking Cart Total Price Calculation
    Given I have multiple products in my cart
    When I view the total price
    Then it should be correctly calculated

Ensuring Empty Cart Message Appears
    Given my cart is empty
    When I open the cart
    Then I should see an empty cart message

Verifying Persistent Cart Data
    Given I have added products to the cart
    When I refresh the page
    Then my cart should retain the previously added products

Ensuring Responsive Design
    Given I open the shopping cart web app on different screen sizes
    When I interact with the website
    Then the layout should remain functional