Feature: people service mock

  Background:
    * def people = {}

############################### MOCK SETUP MATCHES #####################################

  Scenario: pathMatches('mock/v1/people/karate/{name}') && methodIs('post')
    * eval people[pathParams.name] = request
    * def response = { person: '#(pathParams.name)', data: '#(request)' }

############################### MOCK PROVIDER MATCHES ##################################

  Scenario: pathMatches('mock/v1/people') && methodIs('post')
    * def person = {}
    * set person.data = request
    * set person.status = 200
    * eval people[request.name] = person
    * def response = request
    * def responseStatus = 200

  Scenario: pathMatches('mock/v1/people/{name}')
    * def person = people[pathParams.name]
    * def response = ( person ? person.data : '' )
    * def responseStatus = ( person ? person.status : 404 )


