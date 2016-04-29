FactoryGirl.define do
	factory :user do
		sequence :email do |n|
			"dummyEmail#{n}@gmail.com"
		end
		password: "secretpassword"
		password_confirmation: "secretpassword"
	end
end