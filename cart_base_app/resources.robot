*** Settings ***
Library  Selenium2Library
Library  DebugLibrary


resource  pageObject/mainPage.robot
resource  pageObject/checkoutPage.robot


*** Variables ***
${url}      https://react-shopping-cart-67954.firebaseapp.com/ 