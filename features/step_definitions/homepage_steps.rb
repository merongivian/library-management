When(/^I visit the home page$/) do
  visit root_path
end

When(/^I should see the home link$/) do
  expect(page).to have_link I18n.t('layouts.header.home')
end

When(/^a sign in link$/) do
  expect(page).to have_link I18n.t('layouts.header.sign_in')
end

When(/^a books link$/) do
  expect(page).to have_link I18n.t('layouts.header.books')
end

When(/^the page title with the name of the app$/) do
  expect(page).to have_content I18n.t('layouts.header.title')
end

When(/^I should see a title$/) do
  expect(page).to have_content I18n.t('home.index.title')
end

When(/^a short description of the page$/) do
  expect(page).to have_content I18n.t('home.index.body')
end

When(/^a sign up button$/) do
  expect(page).to have_button I18n.t('home.index.sign_up')
end

When(/^I am a native "(.*?)" speaker$/) do |lenguage|
  if lenguage == "spanish"
  	visit root_path(locale: 'es')
  else
  	visit root_path(locale: 'en')
  end
end

When(/^I should see the page in "(.*?)"$/) do |lenguage|
  if lenguage == "spanish"
  	expect(page).to have_content('Libreria')
  else
    expect(page).to have_content('Library')
  end
end