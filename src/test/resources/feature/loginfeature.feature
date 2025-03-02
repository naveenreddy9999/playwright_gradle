Feature: login

  @login
  Scenario: user login
    Given User navigating to the login page
    When log in "log"


  @login1
  Scenario: user login1
    Given User navigating to the login page
    When log in "log one"


  @login2
  Scenario: user login2
    Given User navigating to the login page
    When log in "log2"