## Synopsis

This is a command line application that will allow us to automate certain tasks in JIRA related to the
release cycle.

## Example

$ uar_shipit add_version build1234

## Installation

1. Clone this project.
2. Run bundle to install required gems
3. Create a $PROJECT_HOME/bin/jira_client.yaml config file like this with the jira authentication information:

---
jira:
  user: testinguser
  password: testing123
  url: http://testingurl.com/jira
...

## Testing

This project is using Cucmber and Rspec.

### Cucumber

$ cucumber

Note: This will actually use the jira client config to make calls to Jira so you need to have your jira_client.yaml file
setup before all of the Cucumber tests will pass.

### Rspec

This will run all unit tests:

    $ rspec

To run an individual unit test:

    $ rspec spec/base_spec.rb

## License

Please see [LICENSE.md](LICENSE.md).
