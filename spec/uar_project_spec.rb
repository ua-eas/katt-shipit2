require_relative 'spec_helpers'

describe ShipIt2::UARProject do

  include Helpers

  before :all do
    @project = ShipIt2::UARProject.new
  end

  describe "#new" do
    it "should not raise an exception on instantiation" do
      expect { project = ShipIt2::UARProject.new }.to_not raise_exception
    end

    it "should return a new ShipIt2::UARProject object" do
      expect(@project).to be_a(ShipIt2::UARProject)
    end
  end

  describe "#jira_tag" do
    it "should respond to the jira_tag method call" do
      expect(@project).to respond_to(:jira_tag)
    end

    it "should return UAR for the jira_tag method call" do
      expect(@project.jira_tag).to eq("UAR")
    end
  end

end
