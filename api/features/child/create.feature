Feature: Manage the children
  In order to create a child
  User should be able to submit child details and assign to the room

  Scenario: Create a child unless room is not specified
    Given the request body is:
      """
      {
        "name": "Mike",
        "surname": "Blossom"
      }
      """
    And the "Accept" request header is "application/json"
    And the "Content-Type" request header is "application/json"
    When I request "/children" using HTTP "POST"
    Then the response code is 422
    Then the "Content-Type" response header is "application/problem+json; charset=utf-8"
    Then the response body contains JSON:
      """
      {
        "type": "https:\/\/tools.ietf.org\/html\/rfc2616#section-10",
        "title": "An error occurred",
        "detail": "room: This value should not be blank.",
        "violations": [
          {
            "propertyPath": "room",
            "message": "This value should not be blank.",
            "code": "c1051bb4-d103-4f74-8988-acbcafc7fdc3"
          }
        ]
      }
      """

  Scenario: Create a child unless room is not found
    Given the request body is:
      """
      {
        "name": "Mike",
        "surname": "Blossom",
        "room": { "id": 999 }
      }
      """
    And the "Accept" request header is "application/json"
    And the "Content-Type" request header is "application/json"
    When I request "/children" using HTTP "POST"
    Then the response code is 400

  Scenario: Create a child unless the room capacity is full
    Given the request body is:
      """
      {
        "name": "Mike",
        "surname": "Blossom",
        "room": { "id": 2 }
      }
      """
    And the "Accept" request header is "application/json"
    And the "Content-Type" request header is "application/json"
    When I request "/children" using HTTP "POST"
    Then the response code is 422
    Then the response body contains JSON:
      """
      {
        "type": "https://tools.ietf.org/html/rfc2616#section-10",
        "title": "An error occurred",
        "detail": "room.freeSpace: There is no more space in this room.",
        "violations": [
          {
            "propertyPath": "room.freeSpace",
            "message": "There is no more space in this room.",
            "code": "2beabf1c-54c0-4882-a928-05249b26e23b"
          }
        ]
      }
      """
