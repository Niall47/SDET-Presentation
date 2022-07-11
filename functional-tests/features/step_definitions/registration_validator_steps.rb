# frozen_string_literal: true

require 'pry'

def validate(arg, input)
  response = `cd .. && ruby run.rb -#{arg} #{input} 2>&1`; result=$?.success?
  [$?, response.strip]
end

When(/I run the validator with an input of (.*)$/) do |input|
  # logger.debug("using #{input}")
  @result = validate(input)
end

When(/I run the validator with argument: (.*) and input: (.*)$/) do |arg, input|
  @result = validate(arg, input)
end

Then(/^the response is (.*)$/) do |expected_response|
  expect(@result.last).to eq expected_response 
end
