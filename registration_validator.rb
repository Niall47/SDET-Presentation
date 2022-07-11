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

  def region_code_valid?
    # Check our registration number matches a region and does not contain invalid characters
    region_valid? || !invalid_chars?(@region_code)
  end

  def region_valid?
    @validation_data['region'][@region_code[0]] != nil
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

  def format_valid?
    @value.chars.count == 7 && @value.match?(/[A-Z]{2}\d{2}[A-Z]{3}/) && region_code_valid?
  end

  def print_age
    puts @validation_data['age'][@age_identifier] if valid_age? 
  end

  def print_info
    region = @validation_data['region'][@region_code.chars.first]
    age = @validation_data['age'][@age_identifier]
    puts "#{@value} was registered between #{age} in the #{region} area" if age && region
  end
end
