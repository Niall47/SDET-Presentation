require_relative 'registration_validator.rb'

def check_formatting(input)
    registration_number = Registration_number.new(input)
    if registration_number.format_valid?
        puts "#{input} is valid" 
    else
        puts"#{input} is invalid" 
    end
end

def check_age(input)
    registration_number = Registration_number.new(input)
    if registration_number.format_valid? && registration_number.valid_age?
        registration_number.print_age
    else
        puts "Unable to calulcate age for #{input}"
    end
end

def get_info(input)
    registration_number = Registration_number.new(input)
    if registration_number.format_valid?
        registration_number.print_info
    else
        puts "Unable to get info for #{input}"
    end
end

# Take our command and remove it from ARGV array, this allows us to validate more than one input
command = ARGV.shift
case command
when '-format'
    ARGV.each { |input| check_formatting(input.upcase) }
when '-age'
    ARGV.each { |input| check_age(input.upcase) }
when '-info'
    ARGV.each { |input| get_info(input.upcase) }
when nil
    fail 'You need to provide an argument'
else
    fail 'Unexpected command: ' + command
end
