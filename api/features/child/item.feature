Feature: Manage the child
  In order to get child
  User should be able to get child

  Scenario: Get child
    Given the "Accept" request header is "application/json"
    When I request "/children/1" using HTTP "GET"
    Then the response code is 200
    Then the "Content-Type" response header is "application/json; charset=utf-8"
    Then the response body contains JSON:
      """
      {
        "data": {"id":1,"name":"Bob","surname":"Dylan","archived":false}
      }
      """
