# SDET-Presentation

## Arguments

You must supply an argument(-format, -age, -validate) with an input

`$ ruby run.rb -format AA57AAA`

`$ ruby run.rb -age AA57AAA`

`$ ruby run.rb -validate AA57AAA`

Multiple registration numbers can be entered as arguments

`$ ruby run.rb -format AA57AAA BB57BBB CC57CCC`

## Tests
A rakefile has been setup to run linting, unit tests and functional tests

`bundle exec rake` from the functional-tests directory to run everything
