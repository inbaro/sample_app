Feature: Users
  
  Scenario: List users
    Given that there are a few users signed up
     And one of them is bob@example.com
    When bob@example.com signs in
     And visits the users index
    Then he should see the user index title
     And he should see all the users listed

  Scenario: List users
    Given that there 100 users signed up
    And one of them is bob@example.com
    When bob@example.com signs in
     And visits the users index
    Then he should see the user index title
     And he should see the link Next
     And he should see the first 3 users

 