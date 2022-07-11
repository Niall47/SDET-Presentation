# frozen_string_literal: true

require 'pry'
require 'json'

class Registration_number
  def initialize(input)
    @region_code = input[0..1]
    @age_identifier = input[2..3]
    @random_section = input[4..6]
    @value = input
    @validation_data = JSON.parse(File.read('validations.json'))
  end

  def format_valid?
    # determine if it is in the correct format for a vehicle registration value (two letters, two numbers, three more letters).
    if @value.match?(/[A-Z]{2}\d{2}[A-Z]{3}/)
      "#{@value} matches current style format"
    else
      raise 'invalid format'
    end
  end

  def year_of_registration
    # display the year of registration it represents if the age identifier is valid or an error if it is invalid
    year = @validation_data['age'][@age_identifier]
    if year && format_valid?
      year
    else
      raise "Unable to get age for #{value}"
    end
  end

  def validate
    # check input against all known validation rules
    region = @validation_data['region'][@region_code.chars.first] unless !region_code_valid?
    age = @validation_data['age'][@age_identifier]
    if age && region && !invalid_chars?
      "#{@value} was registered between #{age} in the #{region} area"
    else
      raise "#{@value} was not valid"
    end
  end

  def region_code_valid?
    # Check our registration number matches a region
    @validation_data['region'][@region_code[0]] != nil
  end

  def invalid_chars?
    # Check if our string contains invalid characters
    @value.include?('I') || @value.include?('Q')
  end

  def valid_age?
    # Check if the first character matches a value from our list of valid ones
    @validation_data['age'][@age_identifier] != nil
  end
end
