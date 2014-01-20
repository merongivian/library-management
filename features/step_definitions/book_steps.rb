When(/^There exists an author$/) do
  @author = FactoryGirl.create :author
end

When(/^The author has a book called "(.*?)"$/) do |book|
  @book = FactoryGirl.create :book, author: @author, name: book
end

When(/^I should see an are you sure message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I should see a message showing that you have to pick the book$/) do
  expect(page).to have_content "Your order has been placed, now you have to come and pick it up on our library!"
end

Given(/^I have borrowed a book$/) do
  book = FactoryGirl.create :book, name: "la casa de los espiritus"
  @order = FactoryGirl.create :order, picked: true, user: @user, book: book
end

When(/^I go to my borrowed books page$/) do
  visit my_orders_path
end

Then(/^I should see list with books and statuses$/) do
  expect(page).to have_content "days left to return"
end

Given(/^I am a librarian$/) do
  @user = FactoryGirl.create :user, :librarian, section: 'Art-3-5'
end

When(/^I go to books from my section page$/) do
  visit section_orders_path
end

Then(/^I should see a list with books borrowed from my section$/) do
  expect(page).to have_content "la casa de los espiritus"
end

When(/^I have a borrowed book from my section$/) do
  FactoryGirl.create :order
end

When(/^The has not been picked up yet$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I select "(.*?)"$/) do |link|
  click_link link
end

Then(/^I should see a book picked message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in$/) do
  step %{I follow "Sign In"}
  step "I sign in with my information"
end