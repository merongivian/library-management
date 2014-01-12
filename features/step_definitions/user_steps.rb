When(/^I go to the sign up page$/) do
  visit new_user_registration_path
end

When(/^I fill all the information$/) do
  @user = FactoryGirl.build(:user)
  sign_up @user
end

Then(/^I should be a member$/) do
  expect(User.last).to be_true
end

Then(/^I should see a success sign up message$/) do
  expect(page).to have_content I18n.t('devise.registrations.signed_up_but_unconfirmed')
end

Then(/^I should be in my user page$/) do
  expect(page).to have_content
end

When(/^I have an account$/) do
  @user = FactoryGirl.create :user
end

When(/^I sign in with my information$/) do
  sign_in @user
end

When(/^I should see my user menu$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I should see the sign out link$/) do
  expect(page).to have_content I18n.t('layouts.header.sign_out')
end

When(/^I should see a success sign in message$/) do
  expect(page).to have_content I18n.t('devise.sessions.signed_in')
end

When(/^I should not see the sign in button$/) do
  expect(page).to_not have_link I18n.t('layouts.header.sign_in')
end

When(/^I am signed in$/) do
  step "I have an account"
  step %{I follow "Sign In"}
  step "I sign in with my information"
end

When(/^I should see a see signed out message$/) do
  expect(page).to have_content I18n.t('devise.sessions.signed_out')
end

When /^I follow "([^"]*)"$/ do |link|
  click_link link
end