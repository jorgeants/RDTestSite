FactoryGirl.define do
	factory :message do
		name { Faker::Name.name }
		email { Faker::Internet.safe_email(Faker::Name.first_name) }
		message { Faker::Lorem.paragraph }
	end
end
