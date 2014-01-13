FactoryGirl.define do
  factory :book do
  	sequence(:name) { |i| "name#{i}" }
  	author
  	quantity 3
  	section 'Art-3-5'
  	penalty 30.5
  end
end