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
      expect { jira = ShipIt2::Jira.new }.to_not raise_exception
    end

    it "should return a new ShipIt2::Jira object" do
      expect(@jira).to be_a(ShipIt2::Jira)
    end
  end

  describe "#add_version_for_project" do
    it "should respond to the add_version_for_project method call" do
      expect(@jira).to respond_to(:add_version_for_project)
    end

    it "should create a JIRA::Client object and use it to create a version" do

      mock_jira_version = double("JIRA::Client::Version")
      allow(mock_jira_version).to receive(:save) { true }
      expect(mock_jira_version).to receive(:save).once

      mock_jira_client = double("JIRA::Client")
      mock_jira_project = double("Jira::Project")
      allow(mock_jira_client).to receive_message_chain("Version.build") { mock_jira_version }
      allow(mock_jira_client).to receive_message_chain("Project.find") { mock_jira_project }
      allow(mock_jira_project).to receive(:versions) { [] }

      jira = ShipIt2::Jira.new({:jira_client => mock_jira_client})

      expect { jira.add_version_for_project("testversion1234", "UAR") }.to_not raise_exception
    end

    it "should raise if the version fails to save" do

      mock_jira_version = double("JIRA::Client::Version")
      allow(mock_jira_version).to receive(:save) { false }
      expect(mock_jira_version).to receive(:save).once

      mock_jira_client = double("JIRA::Client")
      mock_jira_project = double("Jira::Project")
      allow(mock_jira_client).to receive_message_chain("Version.build") { mock_jira_version }
      allow(mock_jira_client).to receive_message_chain("Project.find") { mock_jira_project }
      allow(mock_jira_project).to receive(:versions) { [] }

      jira = ShipIt2::Jira.new({:jira_client => mock_jira_client})

      expect { jira.add_version_for_project("testversion1234", "UAR") }.to raise_exception
    end
  end

end
