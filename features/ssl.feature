@ssl
Feature: SSL
  In order to ensure secure connections
  I want to check the SSL configuration of my servers

  Background:
    Given "sslyze.py" is installed

  Scenario: Check SSLv2 is disabled
    When we test using the "sslv2" protocol
    Then the exit status should be 0
    And the output should contain "SSLv2 disabled"

  Scenario: Check certificate is trusted
    When we check the certificate
    Then the output should contain "Certificate is Trusted"
    And the output should match /OK - (Common|Subject Alternative) Name Matches/
    And the output should not contain "Signature Algorithm:               md5"
    And the output should not contain "Signature Algorithm:               md2"
    And the output should contain "Key Size:                          2048"

  Scenario: Check certificate renegotiations
    When we test certificate renegotiation
    Then the output should contain "Client-initiated Renegotiations:    Rejected"
    And the output should contain "Secure Renegotiation:               Supported"

  Scenario: Check SSLv3 is not using weak ciphers
    When we test using the "sslv3" protocol
    Then the output should not contain "Anon"
    And the output should not contain "96bits"
    And the output should not contain "40bits"
    And the output should not contain " 0bits"

