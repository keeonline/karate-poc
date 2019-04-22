Feature: Test the the people service

  Background:
    * def urlBase = karate.properties['mock.base.url']

############################## TEST SCENARIOS ######################################

  Scenario: Testing GET ping
    Given url urlBase + 'mock/v1/ping'
    When method GET
    Then status 200
    * match response.message == 'pong'

