# frozen_string_literal: true

require 'pry'

def area_code_valid?(area_code)
  # Check our registration number matches a region and does not contain invalid characters
  # We are checking both values for invalid character. May not be needed per brief
  region_valid?(area_code.first.to_sym) || !invalid_chars?(area_code.to_s)
end

def region_valid?(character)
  valid_regions = {
    A: 'Anglia',
    B: 'Birmingham',
    C: 'Cymru',
    D: 'Deeside',
    E: 'Essex',
    F: 'Forest and Fens',
    G: 'Garden of England',
    H: 'Hampshire',
    K: 'Milton Keynes',
    L: 'London',
    M: 'Manchester',
    N: 'Newcastle',
    O: 'Oxford',
    P: 'Preston',
    R: 'Reading',
    S: 'Scotland',
    V: 'Severn Valley',
    W: 'West of England',
    X: 'Export',
    Y: 'Yorkshire'
  }
  valid_regions[character] != nil
end

def correct_format?(input)
  # Ensure we are looking at a current style registration
  # eg. AA11AAA
  input.match?(/[A-Z]{2}\d{2}[A-Z]{3}/)
end

# E110

def invalid_chars?(area_code)
  area_code.include?('I') || area_code.include?('Q')
end

def valid_age?(age)
  # convert the array of chars to an integer
  age = age.flatten.join.to_i
  # First registration was 51 followed by 02, so 01 is impossible and 72 is the current highest valid age
  return false if age > 72 || age >= 1


  if (age[0].to_i >= 5)
    puts (age[0].to_i - 5).to_s + age[1]
  else
    puts age
  end
end

# Take an input, if input is not provided or looks invalid we do nothing
if ARGV.empty? || ARGV.first.chars.count != 7 || correct_format?(ARGV.first)
  puts "#{ARGV.first} did not look like a registration number"
else
  # Clean up input and split into sections
  input = ARGV.first.upcase.chars
  area_code = input[0..1]
  age_identifier = input[2..3]
  random_section = input[4..6]
  registration_number = { area_code: area_code, age_identifier: age_identifier, random_section: random_section }
  # binding.pry
  puts "Area code valid? #{area_code_valid?(registration_number[:area_code])}"
end
