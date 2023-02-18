Feature: Manage the room details
  In order to get room
  User should be able to fetch room details

  Scenario: Get child
    Given the "Accept" request header is "application/json"
    When I request "/rooms/1" using HTTP "GET"
    Then the response code is 200
    Then the "Content-Type" response header is "application/json; charset=utf-8"
    Then the response body contains JSON:
      """
      {
        "data": {"id":1,"name":"Apple","maxCapacity":10}
      }
      """
