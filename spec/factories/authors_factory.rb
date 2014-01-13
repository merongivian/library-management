FactoryGirl.define do
  factory :author do
  	sequence(:name) { |i| "name#{i}" }
  end
end
