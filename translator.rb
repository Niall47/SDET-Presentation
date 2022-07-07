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
    region_valid? || !invalid_chars?
  end

  def region_valid?
    @validation_data['region'][@area_code[0]] != nil
  end

  def invalid_chars?
    # We are checking both values for invalid character. May not be needed per brief
    @area_code.include?('I') || @area_code.include?('Q')
  end

  def valid_age?
    binding.pry
    # convert the array of chars to an integer
    # age = age_identifier.flatten.join.to_i
  end

  def random_characters_valid?

  end
end

# Take an input, if input is not provided or looks invalid we do nothing but complain
if ARGV.empty? || ARGV.first.chars.count != 7 || !ARGV.first.match?(/[A-Z]{2}\d{2}[A-Z]{3}/)  
  puts "#{ARGV.first} did not look like a registration number"
else
  registration_number = Registration_number.new(ARGV.first)
  puts registration_number.region_valid? 
  # puts registration_number.area_code_valid?
  # puts registration_number.random_characters_valid?
end
