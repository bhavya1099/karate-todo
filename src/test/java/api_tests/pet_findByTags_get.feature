# ********RoostGPT********

# Test generated by RoostGPT for test java-junit4-test using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /pet/findByTags_get for http method type GET 
# RoostTestHash=01adc2ed1e
# 
# 

# ********RoostGPT********
Feature: Test /v2/pet/findByTags API endpoint

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authToken = karate.properties['auth.token'] || karate.get('authToken')
  * configure headers = { Authorization: '#(authToken)' }

Scenario Outline: Test GET method with valid tags
  Given path '/v2/pet/findByTags'
  And param tags = '<tags>'
  When method get
  Then status 200
  And match each response contains { name: '#string', photoUrls: '#[] string' }

  Examples:
    | tags   |
    | 'pet1' |
    | 'pet2' |
    | 'pet3' |

Scenario Outline: Test GET method with invalid tags
  Given path '/v2/pet/findByTags'
  And param tags = '<tags>'
  When method get
  Then status 400

  Examples:
    | tags      |
    | 'invalid' |
    | ''        |
