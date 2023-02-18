Feature: Manage the children
  In order to get list of children
  User should be able to get list of children

  Scenario: Get list of active children
    Given the "Accept" request header is "application/json"
    When I request "/children?archived=false" using HTTP "GET"
    Then the response code is 200
    Then the "Content-Type" response header is "application/json; charset=utf-8"
    Then the response body contains JSON:
    """
    {
      "meta": {
        "start": 1,
        "limit": 30,
        "page_results": 3,
        "total_results": 3
      },
      "data": [
        {
          "id": 1,
          "name": "Bob",
          "surname": "Dylan",
          "archived": false
        },
        {
          "id": 2,
          "name": "Matt",
          "surname": "Brown",
          "archived": false
        },
        {
          "id": 4,
          "name": "Rob",
          "surname": "Smith",
          "archived": false
        }
      ]
    }
    """

  Scenario: Get list of archived children
    Given the "Accept" request header is "application/json"
    When I request "/children?archived=true" using HTTP "GET"
    Then the response code is 200
    Then the "Content-Type" response header is "application/json; charset=utf-8"
    Then the response body contains JSON:
    """
    {
      "meta": {
        "start": 1,
        "limit": 30,
        "page_results": 1,
        "total_results": 1
      },
      "data": [
        {
          "id": 3,
          "name": "Joe",
          "surname": "Zalenski",
          "archived": true
        }
      ]
    }
    """

  Scenario: Get list of active children with room
    Given the "Accept" request header is "application/json"
    When I request "/children?archived=false&groups[]=read:child.room&groups[]=read:room" using HTTP "GET"
    Then the response code is 200
    Then the "Content-Type" response header is "application/json; charset=utf-8"
    Then the response body contains JSON:
    """
    {
    "meta": {
      "start": 1,
      "limit": 30,
      "page_results": 3,
      "total_results": 3
    },
    "data": [
      {
        "id": 1,
        "name": "Bob",
        "surname": "Dylan",
        "archived": false,
        "room": {
          "id": 1,
          "name": "Apple",
          "maxCapacity": 10
        }
      },
      {
        "id": 2,
        "name": "Matt",
        "surname": "Brown",
        "archived": false,
        "room": {
          "id": 2,
          "name": "Banana",
          "maxCapacity": 2
        }
      },
      {
        "id": 4,
        "name": "Rob",
        "surname": "Smith",
        "archived": false,
        "room": {
          "id": 2,
          "name": "Banana",
          "maxCapacity": 2
        }
      }
    ]
    }
    """

  Scenario: Get list of active children filtered by room
    Given the "Accept" request header is "application/json"
    When I request "/children?archived=false&room=2&groups[]=read:child.room&page=1" using HTTP "GET"
    Then the response code is 200
    Then the "Content-Type" response header is "application/json; charset=utf-8"
    Then the response body contains JSON:
    """
    {
    "meta": {
      "start": 1,
      "limit": 30,
      "page_results": 2,
      "total_results": 2
    },
    "data": [
      {
        "id": 2,
        "name": "Matt",
        "surname": "Brown",
        "archived": false,
        "room": {
          "id": 2
        }
      },
      {
        "id": 4,
        "name": "Rob",
        "surname": "Smith",
        "archived": false,
        "room": {
          "id": 2
        }
      }
    ]
    }
    """
