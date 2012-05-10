Feature: Posting

  Scenario: Bad Micropost data
    Given that there 10 users signed up
    And one of them is bob@example\.com
    And bob@example\.com signs in
    When he visits the home page
    And he presses the "Post" button
    Then he should see an error massage
    And the post count should not change

  Scenario: Good Micropost data
    Given that there 10 users signed up
    And one of them is bob@example.com
    When bob@example.com signs in
    And he visits the home page
    And he fills post content with "Lorem Ipsum"
    And he presses the "Post" button
    Then post count should increase by 1

