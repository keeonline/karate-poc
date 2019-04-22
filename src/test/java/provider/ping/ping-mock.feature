Feature: ping service mock

############################### MOCK PROVIDER MATCHES ##################################

  Scenario: pathMatches('mock/v1/ping') && methodIs('get')
    * def response = { message: 'pong' }
    * def responseStatus = 200


