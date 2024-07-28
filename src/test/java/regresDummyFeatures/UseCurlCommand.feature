Feature: By using curl command testing karate

curl "https://httpbin.org/anything?value=panda"

  Scenario: CURL Method Check
    Given url 'https://httpbin.org/anything'
    And param value = 'panda'
    When method GET
    Then status 200
    Then assert response.headers.Host == 'httpbin.org'
    Then assert response.json == null
    Then assert response.args.value == 'panda'