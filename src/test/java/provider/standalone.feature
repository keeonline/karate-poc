Feature: proxy for all features

  Scenario: pathMatches('mock/v1/people/{name}')
    * eval karate.proceed('http://localhost:8081')

  Scenario: pathMatches('mock/v1/ping')
    * eval karate.proceed('http://localhost:8082')
