require_relative 'spec_helpers'

describe ShipIt2::UARProject do

  include Helpers

  before :all do
    @project = ShipIt2::UARProject.new
  end

  describe "#new" do
    it "should not raise an exception on instantiation" do
      lambda { project = ShipIt2::UARProject.new }.should_not raise_exception
    end

    it "should return a new ShipIt2::UARProject object" do
      @project.should be_an_instance_of ShipIt2::UARProject
    end
  end

  describe "#jira_tag" do
    it "should respond to the jira_tag method call" do
      @project.should respond_to :jira_tag
    end

    it "should return UAR for the jira_tag method call" do
      @project.jira_tag.should == "UAR"
    end
  end

end
