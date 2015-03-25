Feature: User creates a thermometer

  Scenario: User creates thermometer with parameters
    Given User who is logged in
    When User clicks on the create a thermometer button
    Then User is prompted to enter thermometer params and it saves if they are valid

  Scenario: User's max temp rule was violated
    Given Users thermometer gets a reading that is above the max threshold user set
    When Reading is sent
    Then User is notified via email of what happened
  Scenario: Users' thermometer hasn't received a reading in more then five minutes
    Given A user with a working thermometer
    When A thermometer has not produced a reading within five minutes
    Then The user is notified via email of this fact






