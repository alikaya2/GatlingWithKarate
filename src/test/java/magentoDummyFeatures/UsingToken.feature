Feature: Using Token

  Background: Providing Authentication
    * def authentication = ''

    Scenario: Token Using
      Given path 'param'
      And header x-access-token = authentication
      When method get
      Then status 200

