Feature: Search for Quotes

As a blockq user
I want to be able to search for a quote
So that I can use it to better my life


Scenario: Search for a Quote by text
 Given the following quote records
 | text                                                  | author         | user_id |
 | I think therefore I am                                | René Descartes | 1       |
 | Where your treasure is, there your heart will be also | Jesus Christ   | 1       |
 And I am on the home page
 When I fill in "search" with "therefore"
 And I press "search"
 Then I should see "I think therefore I am"
 And I should not see "heart"


 Scenario: Search for a Quote by author name
  Given the following quote records
  | text                                                  | author         | user_id |
  | I think therefore I am                                | René Descartes | 1       |
  | Where your treasure is, there your heart will be also | Jesus Christ   | 1       |
  And I am on the home page
  When I fill in "search" with "Jesus"
  And I press "search"
  Then I should see "there your heart will be also"
  And I should see "Jesus"
  And I should not see "Descartes"

  Scenario: Search for a Quote that does not exist
   Given the following quote records
   | text                                                  | author         | user_id |
   | I think therefore I am                                | René Descartes | 1       |
   | Where your treasure is, there your heart will be also | Jesus Christ   | 1       |
   And I am on the home page
   When I fill in "search" with "Mickey Mouse"
   And I press "search"
   Then I should not see "there your heart will be also"
   And I should not see "Jesus"
   And I should not see "Descartes"
   And I should see "No quotes found"