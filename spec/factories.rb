FactoryGirl.define do
	factory :user do
		first_name "Brandon"
		last_name "Burton"
		sequence(:email) { |n| "user#{n}@odot.com" }
		password "treehouse1"
		password_confirmation "treehouse1"
	end
end