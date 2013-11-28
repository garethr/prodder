@headers
Feature: Secure HTTP headers
  In order to protect users browsing the site
  I want to make sure certain security enhancing HTTP headers are set

  Scenario: Check for HTTP headers
    When we request the site over "HTTPS"
    Then the "Server" header should not be set
    And the "X-Powered-by" header should not be set
    And the "X-XSS-Protection" header should be set to "1; mode=block"
    And the "X-Frame-Options" header should be set to "DENY"
    And the "X-Content-Type-Options" header should be set to "nosniff"
    And the "Set-Cookie" header should have the "httponly" attribute
    And the "Set-Cookie" header should have the "secure" attribute
    And the "Strict-Transport-Security" header should be set to "max-age=16070400; includeSubDomain"
    And the "Content-Security-Policy" header should be set
    And the "X-Content-Security-Policy" header should be set to "allow 'self';"


