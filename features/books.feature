Feature: Getting some books
  In order to borrow books
  As a user
  I should see the list of books available

  Background:
    Given I visit the home page
    And I am signed in

  @javascript
  Scenario: List of available books
    Given There exists an author
    And The author has a book called "Dorian Gray"
    And I follow "Books"
    And I follow "See Books"
    And I follow "Borrow"
    And I confirm popup
    Then I should see a message showing that you have to pick the book

  @javascript
  Scenario: List of my borrowed books
    Given I have borrowed a book
    When I go to my borrowed books page
    Then I should see list with books and statuses

  @javascript
  Scenario: List of books from a librarian
    Given I follow "Sign Out"
    And I am a librarian
    And I sign in
    When I have borrowed a book
    And I go to books from my section page
    #And I wait 10000 seconds
    Then I should see a list with books borrowed from my section

  @javascript
  Scenario: Librarian marks set an order as picked-up
    Given I follow "Sign Out"
    And I am a librarian
    And I am signed in
    When I go to books from my section page
    And I have a borrowed book from my section
    #And I wait 1000 seconds
    And I select "picked"
    And I follow "Yes"
    Then I should see a book picked message



