require_relative '../registration_number.rb'


RSpec.describe Registration_number do
    describe "#format_valid?" do
      it "correctly identify valid format AH20MED" do
        registration_number = Registration_number.new('AH20MED')
        expect{registration_number.format_valid?}.to_not raise_error
        expect(registration_number.format_valid?).to eq "AH20MED matches current style format"
      end
      it "throws an error if registration is lowercase" do
        registration_number = Registration_number.new('bo22ssy')
        expect {registration_number.format_valid?}.to raise_error(RuntimeError, 'invalid format')
      end
      it "throws an error for invalid format CAR18N" do
        registration_number = Registration_number.new('CAR18N')
        expect {registration_number.format_valid?}.to raise_error(RuntimeError, 'invalid format')
      end
    end
    describe "#year_of_registration" do
      it "correctly identify when CA69DDY was registered" do
        registration_number = Registration_number.new('CA69DDY')
        expect(registration_number.year_of_registration).to eq "September 2019 to March 2020"
      end
      it "correctly identify valid format BD51SMR" do
        registration_number = Registration_number.new('BD51SMR')
        expect(registration_number.year_of_registration).to eq "September 2001 to March 2002"
      end
      it "correctly identify invalid format L551HAD" do
        registration_number = Registration_number.new('L551HAD')
        expect {registration_number.year_of_registration}.to raise_error(RuntimeError, 'invalid format')
    end
    describe "#validate" do
      it "provide correct information for CA69DDY" do
        registration_number = Registration_number.new('CA69DDY')
        expect(registration_number.validate).to eq "CA69DDY was registered between September 2019 to March 2020 in the Cymru area"
      end
      it "correctly identify valid format BD51SMR" do
        registration_number = Registration_number.new('BD51SMR')
        expect(registration_number.validate).to eq "BD51SMR was registered between September 2001 to March 2002 in the Birmingham area"
      end
      it "correctly identify invalid format ZA51HAD" do
        registration_number = Registration_number.new('ZA51HAD')
        expect{registration_number.validate}.to raise_error(RuntimeError, 'ZA51HAD was not valid')
      end
    end
  end
end
