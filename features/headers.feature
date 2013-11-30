@headers
Feature: Secure HTTP headers
  In order to protect users browsing the site
  I want to make sure certain security enhancing HTTP headers are set

  Background:
    When we request the site over "HTTPS"

  Scenario: Protect against cross site scripting
    Then the "X-XSS-Protection" header should be set to "1; mode=block"

  Scenario: Exposing information about the server software
    Then the "Server" header should not be set
    And the "X-Powered-by" header should not be set

  Scenario: Protect against click jacking
    Then the "X-Frame-Options" header should be set to "DENY"
    And the "X-Content-Type-Options" header should be set to "nosniff"

  Scenario: Cookies should be secure
    Then if present, the "Set-Cookie" header should have the "httponly" attribute
    And if present, the "Set-Cookie" header should have the "secure" attribute

  Scenario: Strict Transport security should be anabled
    Then the "Strict-Transport-Security" header should be set to "max-age=16070400; includeSubDomain"

  Scenario: A content security policy should be in place
    Then the "Content-Security-Policy" header should be set
    And the "X-Content-Security-Policy" header should be set to "allow 'self';"
