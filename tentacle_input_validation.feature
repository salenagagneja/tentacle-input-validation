Feature: Tentacle input validation

  Scenario Outline: Valid input values
    Given I am on the tentacle input form
    When I enter "<tentacle_count>" in the number of tentacles field
    And I click the send button
    Then I should see a "Success" message

    Examples:
      | tentacle_count |
      | 10             |
      | 50             |
      | 100            |
      | 75             |
      | 20             |

  Scenario Outline: Invalid input values
    Given I am on the tentacle input form
    When I enter "<tentacle_count>" in the number of tentacles field
    And I click the send button
    Then I should see an "Error" message

    Examples:
      | tentacle_count |
      | 9              |
      | 101            |
      | 0              |
      | 200            |
      | -5             |

  Scenario: Input is empty
    Given I am on the tentacle input form
    When I leave the number of tentacles field empty
    And I click the send button
    Then I should see an "Error" message

  Scenario Outline: Input is not a number
    Given I am on the tentacle input form
    When I enter "<invalid_value>" in the number of tentacles field
    And I click the send button
    Then I should see an "Error" message

    Examples:
      | invalid_value |
      | abc           |
      | 12.34         |
      | @!#           |
      | ten           |
      | 100ten        |

  Scenario Outline: Boundary values
    Given I am on the tentacle input form
    When I enter "<tentacle_count>" in the number of tentacles field
    And I click the send button
    Then I should see a "<message>" message

    Examples:
      | tentacle_count | message  |
      | 10             | Success  |
      | 100            | Success  |
      | 9              | Error    |
      | 101            | Error    |
