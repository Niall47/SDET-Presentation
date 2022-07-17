# frozen_string_literal: true

def validate(arg, input)
  response = `cd .. && ruby run.rb -#{arg} #{input} 2>&1`
  [$CHILD_STATUS, response.strip]
end

When(/I run the validator with argument: (.*) and input: (.*)$/) do |arg, input|
  @result = validate(arg, input)
end

Then(/^the response is (.*)$/) do |expected_response|
  expect(@result.last).to include expected_response
end
