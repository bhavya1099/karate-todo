# ********RoostGPT********

# Test generated by RoostGPT for test java-junit4-test using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pet/{petId}_delete for http method type DELETE 
# RoostTestHash=1138243cb1
# 
# 

# ********RoostGPT********
Feature: Petstore API Tests

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authToken = karate.properties['auth.token'] || karate.get('authToken', '123456')
  * configure headers = { Authorization: '#(authToken)' }

Scenario: Delete a pet
  Given path 'v2/pet', 1
  And header api_key = authToken
  When method delete
  Then status 200
  And match response == { message: 'Pet deleted successfully' }

Scenario Outline: Delete a pet with different petId
  Given path 'v2/pet', <petId>
  And header api_key = authToken
  When method delete
  Then status <statusCode>
  And match response == <responseBody>

  Examples:
  | petId | statusCode | responseBody                            |
  | 2     | 200        | { message: 'Pet deleted successfully' } |
  | 3     | 404        | { message: 'Pet not found' }           |
  | 'abc' | 400        | { message: 'Invalid ID supplied' }     |
