Feature: Users
  In order to enjoy the bennefits of being a member
  As a user
  I want to register in the library page

Scenario: Sign up
  Given I visit the home page
  When I follow "Sign up Today"
  And I fill all the information
  Then I should be a member
  And I should see a success sign up message

Scenario: Sign in as a member
  Given I visit the home page
  And I have an account
  When I follow "Sign In"
  And I sign in with my information
  #Then I should be in my user page
  #And I should see my user menu
  And I should see a success sign in message
  And I should see the sign out link
  And I should not see the sign in button

Scenario: Sign out
  Given I visit the home page
  And I am signed in
  When I follow "Sign Out"
  Then I should see a see signed out message