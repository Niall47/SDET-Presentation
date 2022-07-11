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
    describe "#age" do
      it "correctly identify when CA69DDY was registered" do
        registration_number = Registration_number.new('CA69DDY')
        expect(registration_number.age).to eq "September 2019 to March 2020"
      end
      it "correctly identify valid format BD51SMR" do
        registration_number = Registration_number.new('BD51SMR')
        expect(registration_number.age).to eq "September 2001 to March 2002"
      end
      it "correctly identify invalid format ZA51HAD" do
      registration_number = Registration_number.new('ZA51HAD')
      expect(registration_number.age).to be false
    end
    describe "#Validate" do
      it "provide correct information for CA69DDY" do
        registration_number = Registration_number.new('CA69DDY')
        expect(registration_number.age).to eq "September 2019 to March 2020"
      end
      it "correctly identify valid format BD51SMR" do
        registration_number = Registration_number.new('BD51SMR')
        expect(registration_number.age).to eq "September 2001 to March 2002"
      end
      it "correctly identify invalid format ZA51HAD" do
      registration_number = Registration_number.new('ZA51HAD')
      expect(registration_number.age).to be false
    end
  end
end




  # expect {
  #   registration_number.region_code_valid?
  # }.to raise_error(StandardError)