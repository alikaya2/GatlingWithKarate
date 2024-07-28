Feature: Get Methods

  Background:
    * url baseUrlForRegresIn
    * def email = 'name.sirname34@gmail.com'
    * configure headers = karate.get('headers')

  Scenario: Get Method Check 200
    Given url baseUrlForRegresIn + 'api/users?page=2'
    And headers headers
    When method GET
    Then status 200
    Then assert response.page == '2'
    Then assert response.total == '12'
    Then assert response.data[0].id == '7'
    Then assert response.data[0].email == 'michael.lawson@reqres.in'
    Then assert response.support.text == 'To keep ReqRes free, contributions towards server costs are appreciated!'

  Scenario: Get Method Check 404
    Given url baseUrlForRegresIn + '/api/users/23'
    And headers headers
    When method GET
    Then status 404

  Scenario: Put Method For Update User Name
    Given url baseUrlForRegresIn + '/api/users/2'
    And request
    """
    {
    "name": "morpheus",
    "job": "zion resident"
    }
    """
    And headers headers
    When method PUT
    Then status 200
    Then assert response.name == 'morpheus'
    Then assert response.job == 'zion resident'

  Scenario: Register Method
    Given url baseUrlForRegresIn + 'api/register'
    And request
      """
      {
        "email": "eve.holt@reqres.in",
        "password": "pistol"
      }
      """
    When method POST
    Then status 200
    Then assert response.id == '4'
    Then assert response.token == 'QpwL5tke4Pnpja7X4'
