require 'rails_helper'

RSpec.describe Message, type: :model do

	context "valid Factory" do
		it "has a valid factory" do
			expect(build(:message)).to be_valid
		end
	end
  
	context 'validations' do
		before { FactoryGirl.build(:message) }

		context "presence" do	
			it { should validate_presence_of(:name) }
			it { should validate_presence_of(:email) }
			it { should validate_presence_of(:message) }
		end

	end
end

