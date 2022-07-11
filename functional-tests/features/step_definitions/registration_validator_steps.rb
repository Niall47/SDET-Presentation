# frozen_string_literal: true

require 'pry'

def validate(input)
  response = `cd .. && ruby run.rb -validate #{input}2>&1`; result=$?.success?
  [$?, response.strip]
end

When(/I run the validator with an input of (.*)$/) do |input|
  pp validate(input)
end

Then(/^the response is (.*) (.*) (.*)$/) do |cukes, cukes2, cukes3|
  # fail 'HelloAgain'
end
