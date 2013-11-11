Feature: The Homepage
  In order to access library management
  As a new user that speaks any language
  I want to access the home page

Scenario: Navigation Bar
  Given I visit the home page
  Then I should see the home link
  And a sign in link
  And a books link
  And the page title with the name of the app

Scenario: Home page content
  Given I visit the home page
  Then I should see a title
  And a short description of the page
  And a sign up button

Scenario: Page in english
  Given I am a native "english" speaker
  Then I should see the page in "english"

Scenario: Page in spanish
  Given I am a native "spanish" speaker
  Then I should see the page in "spanish"