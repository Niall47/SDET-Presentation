Feature: Registration Validator

As an EO
I want a promotion
So I can buy a house

@happy_path
Scenario: I submit a valid Registration
    When I run the validator with an input of ''
    Then the response is '' '' ''