Feature: Users
  In order to enjoy the bennefits of being a member
  As a user
  I want to register in the library page

Scenario: Sign up
  Given I visit the home page
  When I go to the sign up page
  And I fill all the information
  Then I should be a member
  And I should see a success sign up message
  And I should be in my user page

Scenario: Sign in as a member
  Given I visit the home page
  And I have an account
  When I sign in with my information
  Then I should be in my user page
  And I should see my user menu
  And I should see the sign out link
  And I should see a success sign in message

Scenario: Sign in as a user whitout an account

Scenario: Sign out
  Given I visit the home page
  And I am signed in
  When I click on the sign out button
  Then I should be kicked out of my user page
  And I should not see my user menu
  And I should see a success sign out message