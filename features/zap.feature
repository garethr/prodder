@zap
Feature: ZAP
  In order to avoid known security issues
  I want to scan the site using OWASP ZAP

  Scenario: Scan with ZAP
    Given ZAP is running
    When we scan the site via the proxy
    Then we should find less than "1" high priority alerts
    And we should find less than "6" low priority alerts
    And we should find less than "10" alerts
