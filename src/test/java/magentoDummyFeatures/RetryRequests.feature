Feature: Retry
  
  Background: Retry Background
    * configure retry = { count = 10 , interval = 500 }

    Scenario: Retry

      Given url baseUrl
      And retry until responseStatus == 500
