FactoryGirl.define do
  factory :user do
	sequence(:name) { |i| "name#{i}" }
    sequence(:email) { |i| "user#{i}@example.com" }
    password 'qwerty1234'
  end
end
