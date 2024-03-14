# ********RoostGPT********

# Test generated by RoostGPT for test java-junit4-test using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /user/createWithList_post for http method type POST 
# RoostTestHash=41ad79e90d
# 
# 

# ********RoostGPT********
Feature: User Creation with List

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    * def authToken = karate.get('authToken', '$processEnvironment.AUTH_TOKEN')
    * configure headers = { Authorization: '#(authToken)' }

  Scenario: Verify successful operation of creating list of users with given input array
    Given path '/v2/user/createWithList'
    And request [{id: 1, username: 'TestUser1', firstName: 'Test', lastName: 'User', email: 'testuser1@example.com', password: 'password1', phone: '1234567890', userStatus: 1}, 
                 {id: 2, username: 'TestUser2', firstName: 'Test', lastName: 'User', email: 'testuser2@example.com', password: 'password2', phone: '0987654321', userStatus: 2}]
    When method post
    Then status 200
    And match response == {description: 'successful operation'}
