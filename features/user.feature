Feature: User signs up

  Scenario: User would like to register for the site
    Given User goes to homepage
    When User clicks register
    Then User is redirected to a screen instructing him to register
  Scenario: User would like to register for the site with google
    Given User goes to homepage
    When  User clicks register with google
    Then User is redirected to google login and if he signs up, he is a user

  Scenario: User is registered and would like to log in
    Given User goes to homepage
    When User clicks login button
    Then User is prompted to enter his username and address


