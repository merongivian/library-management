When(/^I go to the sign up page$/) do
  visit new_user_registration_path
end

When(/^I fill all the information$/) do
  @user = FactoryGirl.build(:user)
  sign_up @user
  sleep(10)
end

Then(/^I should be a member$/) do
  expect(User.last).to be_true
end

Then(/^I should see a success sign up message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be in my user page$/) do
  pending # express the regexp above with the code you wish you had
end