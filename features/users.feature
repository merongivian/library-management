Feature: Users
  In order to enjoy the bennefits of being a member
  As a user
  I want to register in the library page

Background:
  Given I visit the home page

Scenario: Sign up
  When I follow "Sign up Today"
  And I fill all the information
  Then I should be a member
  And I should see a success sign up message

@javascript
Scenario: Sign in as a member
  And I have an account
  When I follow "Sign In"
  And I sign in with my information
  And I wait 1000 seconds
  #Then I should be in my user page
  #And I should see my user menu
  And I should see a success sign in message
  And I should see the sign out link
  And I should not see the sign in button

Scenario: Sign out
  And I am signed in
  When I follow "Sign Out"
  Then I should see a see signed out message