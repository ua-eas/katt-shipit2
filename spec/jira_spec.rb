require_relative 'spec_helpers'

describe ShipIt2::Jira do

  include Helpers

  before :all do
    #Uncomment this line and use the -d when you run rspec for debugger
    #debugger

    @jira = ShipIt2::Jira.new()
  end

  describe "#new" do
    it "should not raise an exception on instantiation" do
      lambda { jira = ShipIt2::Jira.new }.should_not raise_exception
    end

    it "should return a new ShipIt2::Jira object" do
      @jira.should be_an_instance_of ShipIt2::Jira
    end
  end

  describe "#add_version_for_project" do
    it "should respond to the add_version_for_project method call" do
      @jira.should respond_to :add_version_for_project
    end

    it "should create a JIRA::Client object and use it to create a version" do

      mock_jira_version = double("JIRA::Client::Version")
      mock_jira_version.stub(:save) { true }
      mock_jira_version.should_receive(:save).once

      mock_jira_client = double("JIRA::Client")
      mock_jira_client.stub_chain("Version.build").and_return(mock_jira_version)

      jira = ShipIt2::Jira.new({:jira_client => mock_jira_client})

      lambda { jira.add_version_for_project("testversion1234", "UAR") }.should_not raise_exception
    end

    it "should raise if the version fails to save" do

      mock_jira_version = double("JIRA::Client::Version")
      mock_jira_version.stub(:save) { false }
      mock_jira_version.should_receive(:save).once

      mock_jira_client = double("JIRA::Client")
      mock_jira_client.stub_chain("Version.build").and_return(mock_jira_version)

      jira = ShipIt2::Jira.new({:jira_client => mock_jira_client})

      lambda { jira.add_version_for_project("testversion1234", "UAR") }.should raise_exception
    end
  end

end
