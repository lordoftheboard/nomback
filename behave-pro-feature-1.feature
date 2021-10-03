Feature: behave pro feature 1

  Background:
    Given the following nominations already exist
    And the following topology already exist

  @nomination-and-dataquit
  Scenario: simple nomination
    When the following nomination is transmitted
      | nominator | value |
      | bg1       | 50    |
      | bg1       | 10    |
    Then the dataquit status should be as follows
      | nominator | status |
      | bg1       | OK     |
      | bg2       | OK     |
