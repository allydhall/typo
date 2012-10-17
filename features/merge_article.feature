Feature: Merge Articles
  As a blogger
  In order to have multiple bloggers on one topic
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And the following articles exist: 
      | title | author  | body |
      | foo   | Allison | tdd  |
      | bar   | Casey   | bdd  |

 
  Scenario: A non-admin cannot merge two articles
    Given I am not logged into the admin panel     
    And I am on the view page for "foo" 
    Then I should not see "Merge Articles"
 
  Scenario: A admin can merge two articles
    Given I am logged into the admin panel     
    And I am on the view page for "foo" 
    Then I should see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
   Given I am logged into the admin panel     
    And I am on the view page for "foo" 
    And I fill in "merge_id" with "2"
    And I press "Merge"
    Then I should be on the view page for "foo"  
    And I should see "tdd"
    And I should see "bdd"

  Scenario: Keep only one author on merge
    Given I am logged into the admin panel     
    And I am on the view page for "foo" 
    And I fill in "merge_id" with "2"
    And I press "Merge"
    Then I should be on the view page for "foo"
    And I should see "Allison"
    And I should not see "Casey"
