Feature: UAR Jira Automation

  As an automated user, we need to be able to perform project management
  tasks in jira.

  Scenario Outline: The automated user adds a new build version
    When I run the command "bin/shipit_uar add_version <new_version>"
    Then the command should return successfully
      And  I should not see anything on stderr
      And I should see the "<new_version>" available to be selected for jiras

      Examples:
      | new_version      |
      | testingbuild86   |
      | testingrelease17 |
