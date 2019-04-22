Feature: Test the the people service

  Background:
    * def urlBase = karate.properties['mock.base.url']

######################## CONFIG MOCK FOR NON-DEFAULT RESPONSES #####################

  Scenario: Setup example 2
    Given url urlBase + 'mock/v1/people/karate/Emily'
    And request { status: 201, data: { name: Emily, age: 24 } }
    When method POST
    Then status 200

  Scenario: Setup example 2
    Given url urlBase + 'mock/v1/people/karate/Charlotte'
    And request { status: 202, data: { name: Charlotte, age: 26 } }
    When method POST
    Then status 200

############################## TEST SCENARIOS ######################################

  Scenario: Testing POST person
    Given url urlBase + 'mock/v1/people'
    And request { name: Anne, age: 22 }
    When method POST
    Then status 200

  Scenario: Testing GET unknown person
    Given url urlBase + 'mock/v1/people/Unknown'
    When method GET
    Then status 404

  Scenario Outline: Testing GET known person
    Given url urlBase + 'mock/v1/people/<name>'
    When method GET
    Then status <status>
    * match response.name == '<name>'
    * match response.age == '#number'

    Examples:
      | name      | status |
      | Anne      | 200    |
      | Emily     | 201    |
      | Charlotte | 202    |

