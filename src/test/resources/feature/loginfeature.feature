Feature: login

  @login_mvn
  Scenario: user login
    Given User navigating to the login page
    When log in "log"


  @login
  Scenario: user login1
    Given User navigating to the login page
    When log in "log one"


  @login2
  Scenario: user login2
    Given User navigating to the login page
    When log in "log2"