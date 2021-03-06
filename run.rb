# frozen_string_literal: true

require_relative 'registration_number'

def check_formatting(input)
  registration_number = RegistrationNumber.new(input, @validation_data)
  puts registration_number.format_valid?
end

def check_age(input)
  registration_number = RegistrationNumber.new(input, @validation_data)
  puts registration_number.year_of_registration
end

def validate(input)
  registration_number = RegistrationNumber.new(input, @validation_data)
  puts registration_number.validate
end

# Take our command and remove it from ARGV array, this allows us to validate more than one input
@validation_data = JSON.parse(File.read('validations.json'))
command = ARGV.shift
case command
when '-format'
  ARGV.each { |input| check_formatting(input.upcase) }
when '-age'
  ARGV.each { |input| check_age(input.upcase) }
when '-validate'
  ARGV.each { |input| validate(input.upcase) }
when nil
  raise 'You need to provide an argument'
else
  raise "Unexpected command: #{command}"
end
