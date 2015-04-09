require_relative 'spec_helpers'

describe ShipIt2::JiraConfig do

  include Helpers

  before :all do
    @config_args = { :config_file => "spec/resources/jira_config.yaml" }
    @config = ShipIt2::JiraConfig.new(@config_args)
  end

  describe "#new" do
    it "should not raise an exception on instantiation" do
      expect { config = ShipIt2::JiraConfig.new(@config_args) }.to_not raise_exception
    end

    it "should return a new ShipIt2::Config object" do
      expect(@config).to be_a(ShipIt2::JiraConfig)
    end
  end

  describe "#jira_user" do
    it "should respond to the jira_user method call" do
      expect(@config).to respond_to(:jira_user)
    end

    it "should return the correct jira username" do
      expect(@config.jira_user).to eq("testinguser")
    end
  end

  describe "#jira_password" do
    it "should respond to the jira_password method call" do
      expect(@config).to respond_to(:jira_password)
    end

    it "should return the correct jira password" do
      expect(@config.jira_password).to eq("testing123")
    end
  end

  describe "#jira_url" do
    it "should respond to the jira_url method call" do
      expect(@config).to respond_to(:jira_url)
    end

    it "should return the correct jira url" do
      expect(@config.jira_url).to eq("http://testingurl.com/jira")
    end
  end

end
