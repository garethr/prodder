@ports
Feature: Open ports
  In order to limit access to services
  I want to make sure only ports that need to be exposed are open

  Background:
    Given "nmap" is installed

  Scenario: Scan for open ports
    When we scan the site for open ports
    Then we should find port "80" open
    Then we should find port "443" open
    Then we should find port "22" closed
    And we should find only "2" port open


