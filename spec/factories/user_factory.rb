FactoryGirl.define do
  factory :user do
	sequence(:name) { |i| "name#{i}" }
    sequence(:email) { |i| "user#{i}@example.com" }
    password 'qwerty1234'
    confirmation_token nil
    confirmation_sent_at { Time.now - 3.seconds }
    confirmed_at { Time.now }
    updated_at { Time.now }
  end
end
