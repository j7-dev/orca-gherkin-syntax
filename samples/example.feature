# language: en
@checkout @smoke
Feature: Shopping cart checkout
  As a shopper
  I want to pay for the items in my cart

  Background:
    Given the store has the following products:
      | name   | price |
      | Apple  | 1.50  |
      | Banana | 0.75  |

  Rule: Customers can only check out a non-empty cart

    @happy-path
    Scenario Outline: Paying for <quantity> apples
      Given I add <quantity> "Apple" to the cart
      When I check out with card "4242 4242 4242 4242"
      Then the total should be <total>
      And I should receive a receipt:
        """json
        { "items": <quantity>, "total": <total> }
        """
      But no email is sent if <quantity> is 0

      Examples:
        | quantity | total |
        | 1        | 1.50  |
        | 3        | 4.50  |

    Scenario: Empty cart
      * I check out
      Then I see the message 'Your cart is empty'
