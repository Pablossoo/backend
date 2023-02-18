Feature: Retrieve the room statistics
  In order to get list of room statistics
  User should be able to get list of room statistics

  Scenario: Get list of room statistics
    Given the "Accept" request header is "application/json"
    When I request "/rooms/statistics" using HTTP "GET"
    Then the response code is 200
    Then the "Content-Type" response header is "application/json; charset=utf-8"
    Then the response body contains JSON:
    """
    {
        "data": [
            {
                "room": {
                    "id": 1
                },
                "count": 1
            },
            {
                "room": {
                    "id": 2
                },
                "count": 2
            },
            {
                "room": {
                    "id": 3
                },
                "count": 0
            }
        ]
    }
    """

  Scenario: Get list of room statistics
    Given the "Accept" request header is "application/json"
    When I request "/rooms/statistics?id[]=2&id[]=3" using HTTP "GET"
    Then the response code is 200
    Then the "Content-Type" response header is "application/json; charset=utf-8"
    Then the response body contains JSON:
    """
    {
        "data": [
            {
                "room": {
                    "id": 2
                },
                "count": 2
            },
            {
                "room": {
                    "id": 3
                },
                "count": 0
            }
        ]
    }
    """
