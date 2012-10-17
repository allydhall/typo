Feature: Merge Articles
  As a reader 
  In order to view my comments
  I want to be able to see my comments on merged articles

  Background:
    Given the blog is set up
    And the following articles exist:
      | title | author  | body |
      | foo   | Allison | tdd  |
      | bar   | Casey   | bdd  |

    And the following comments exist:
      | title  | article_id | body  | author |
      | foo_c  | 1          | great | lisa   |
      | bar_c  | 2          | cool  | lisa   |

  Scenario: comments go to merged article
    Given I am logged into the admin panel     
    And I am on the view page for "foo" 
    And I fill in "merge_id" with "2"
    And I follow "Merge With This Article"
    Then I should be on the view page for "foo"
    And I should see "foo_c"
    And I should see "bar_c"

