# frozen_string_literal: true

require 'pry'
require 'json'

class Registration_number
  def initialize(input)
    @area_code = input[0..1]
    @age_identifier = input[2..3]
    @random_section = input[4..6]
    @value = input
    @validation_data = JSON.parse(File.read('validations.json'))
  end

  def area_code_valid?
    # Check our registration number matches a region and does not contain invalid characters
    region_valid? || !invalid_chars?(@area_code)
  end

  def region_valid?
    @validation_data['region'][@area_code[0]] != nil
  end

  def invalid_chars?(string)
    string.include?('I') || string.include?('Q')
  end

  def valid_age?
    @validation_data['age'][@age_identifier] != nil
  end

  def random_characters_valid?
    !invalid_chars?(@random_section)
  end

  def print_info
    region = @validation_data['region'][@area_code.chars.first]
    age = @validation_data['age'][@age_identifier]
    if region && age
      puts "Your vehicle was registered between #{age} in the #{region} area"
    end
  end
end


def check_formatting(input)
  if input.match?(/[A-Z]{2}\d{2}[A-Z]{3}/) && input.chars.count == 7
    puts "#{input} looks valid"
  else
    puts "#{input} looks invalid"
  end
end

def check_age(input)
  registration_number = Registration_number.new(input)
  if registration_number.valid_age?
    puts 'age looks valid'
  else
    puts 'age looks invalid'
  end
end

def get_info(input)
  registration_number = Registration_number.new(input)
  registration_number.print_info
end

# Take our command and remove it from ARGV array, this allows us to validate more than one input
command = ARGV.shift
case command
when '-format'
  ARGV.each { |input| check_formatting(input) }
when '-age'
  ARGV.each { |input| check_age(input) }
when '-info'
  ARGV.each { |input| get_info(input) }
else
  fail 'Unexpected command: ' + command
end



# If input is not provided or looks invalid we do nothing but complain
# if ARGV.empty? || ARGV.first.chars.count != 7 || !ARGV.first.match?(/[A-Z]{2}\d{2}[A-Z]{3}/)  
#   puts "#{ARGV.first} did not look like a registration number"
# else
#   # Otherwise we print out the results
#   registration_number = Registration_number.new(ARGV.first)
#   result = {area_code: registration_number.area_code_valid?,
#           age: registration_number.valid_age?,
#           random_characters: registration_number.random_characters_valid?}.to_json
#   puts result
# end
