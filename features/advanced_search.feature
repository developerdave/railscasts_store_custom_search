Feature: Advanced Search

  Scenario: follow advanced search option
    Given I go to the "list of products" page
    When I select advanced search
    Then I should be taken to the advanced search page

  Scenario: perform basic search
    Given I go to the "advanced search" page
    When I search for "Acoustic"
    Then I should see my search results

  Scenario: perform keyword and category search
    Given I go to the "advanced search" page
    When I search for "Acoustic" in the category "Toys & Games"
    Then I should see my search results

  Scenario: perform price search
    Given I go to the "advanced search" page
    When I search for a product between $10 and $30
    Then I should see my search results

  Scenario: no results returned
    Given I go to the "advanced search" page
    When I search for "zd"
    Then I should see the no records found message
