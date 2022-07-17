Feature: Registration Validator

As a user of the registration number system
I want to validate registration numbers
So I can use the system correctly

@happy_path
Scenario: I check the age of a valid registration number
    When I run the validator with argument: age and input: PE59USY
    Then the response is September 2009 to March 2010

@happy_path
Scenario: I check the format of a valid registration
    When I run the validator with argument: format and input: AB69LOL
    Then the response is AB69LOL matches current style format

@happy_path
Scenario: I validate a valid registration 
    When I run the validator with argument: validate and input: PE59USY
    Then the response is PE59USY was registered between September 2009 to March 2010 in the Preston area

Scenario: I submit an invalid argument
    When I run the validator with argument: helloworld and input: PE59USY
    Then the response is Unexpected command: -helloworld
