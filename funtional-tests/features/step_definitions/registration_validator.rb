require 'pry'
When(/I run the validator with an input of (.*)$/) do |cukes|
  binding.pry
  puts system('ls ../../../')
end

Then(/^the response is (.*) (.*) (.*)$/) do |cukes, cukes2, cukes3|
  fail 'HelloAgain'
end
