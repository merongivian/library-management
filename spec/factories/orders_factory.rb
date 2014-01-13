FactoryGirl.define do
  factory :order do
  	user
  	book
  	picked_up_at { Date.current }
  end
end