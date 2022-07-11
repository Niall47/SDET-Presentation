# frozen_string_literal: true

require 'pry'

def validate(_input)
  response = `cd .. && ruby run.rb -info \' + input`
  p response
  # system('cd .. && ruby run.rb -info ' + input)
end

When(/I run the validator with an input of (.*)$/) do |input|
  validate(input)
end

Then(/^the response is (.*) (.*) (.*)$/) do |cukes, cukes2, cukes3|
  # fail 'HelloAgain'
end
