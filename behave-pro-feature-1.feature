Feature: behave pro feature 1

  Background:
    Given the following nominations already exist
    And the following topology already exist

  @ORPHAN
  Scenario: simple nomination
    Given the following nomination is transmitted
     |nominator|value|
    | bg1     | 50  |
     | bg1     | 10  |
    
