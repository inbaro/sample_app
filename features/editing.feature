Feature: Editing
  
  Scenario: Visit edit page
    Given a signed in user visits the edit user page
    Then he should the edit page title
    And he should see the edit page header
    And he should have a link to change gravatar picture

  Scenario: Non signed in user visits edit page
    Given a non signed in user visits the edit user page
    Then he should see the signin title

  Scenario: Non signed in user visits edit page then signs in
    Given a non signed in user visits the edit user page
    When he signs in after being redirected to the signing page
    Then he should see the edit page header

  Scenario: Different users visits edit page
    Given a userA exists
      And UserB exists
    When UserB visits the edit user page of UserA
    Then he should not see the edit page title
  
  Scenario: Bad edit
    Given a signed in user visits the edit user page
    When the user clicks the save changes button
    Then he should see an error massage 

Scenario: Good edit
    Given a signed in user visits the edit user page
      And the user submits valid user information
    When the user clicks the save changes button
    Then he should see an updated title
      And he should see a success message
      And he should see a link to sign out
      And the user name should be updated in the database
      And the email should be updated in the database 
