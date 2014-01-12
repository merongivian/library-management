Feature: Getting some books
  In order to borrow books
  As a user
  I should see the list of books available

  Background:
    Given I visit the home page
    And I am signed in

  Scenario: List of available books
    Given I visit the books page
    And The library has an "available" book
    And I follow "borrow"
    Then I should see a when do you pick it message
    And I select the date
    And I follow "Yes"
    Then I should see an advice message

  Scenario: List of my borrowed books
    Given I have borrowed a book
    When I go to my borrowed books page
    Then I should see a list with dates

  Scenario: List of books from a librarian
    Given I am signed out
    And I am a librarian
    And I am signed in
    When I go to books from my section page
    Then I should see a list with books borrowed from my section



