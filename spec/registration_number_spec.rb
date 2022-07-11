require_relative '../registration_number.rb'


RSpec.describe Registration_number do
    describe "#format_valid?" do
      it "correctly identify valid format AH20MED" do
        registration_number = Registration_number.new('AH20MED')
        expect(registration_number.format_valid?).to be true
      end
      it "correctly identify valid format BO22SSY" do
        registration_number = Registration_number.new('BO22SSY')
        expect(registration_number.format_valid?).to be true
      end
      it "correctly identify invalid format CAR18N" do
        registration_number = Registration_number.new('CAR18N')
        expect(registration_number.format_valid?).to be false
      end
    end
    describe "#region_code_valid?" do
      it "correctly identify valid format CA69DDY" do
        registration_number = Registration_number.new('CA69DDY')
        expect(registration_number.region_code_valid?).to be true
      end
      it "correctly identify valid format BD51SMR" do
        registration_number = Registration_number.new('BD51SMR')
        expect(registration_number.region_code_valid?).to be true
      end
      it "correctly identify invalid format ZA51HAD" do
      registration_number = Registration_number.new('ZA51HAD')
      expect(registration_number.region_code_valid?).to be false
    end
    end
  end




  # expect {
  #   registration_number.region_code_valid?
  # }.to raise_error(StandardError)