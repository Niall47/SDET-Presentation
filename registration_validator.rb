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
end

# If input is not provided or looks invalid we do nothing but complain
if ARGV.empty? || ARGV.first.chars.count != 7 || !ARGV.first.match?(/[A-Z]{2}\d{2}[A-Z]{3}/)  
  puts "#{ARGV.first} did not look like a registration number"
else
  # Otherwise we create print out the reults
  registration_number = Registration_number.new(ARGV.first)
  result = {area_code: registration_number.area_code_valid?,
          age: registration_number.valid_age?,
          random_characters: registration_number.random_characters_valid?}.to_json
  puts result
end
