require_relative 'spec_helpers'

describe ShipIt2::Config do

  include Helpers

  before :all do
    @config_args = { :config_file => "spec/resources/jira_config.yaml" }
    @config = ShipIt2::Config.new(@config_args)
  end

  describe "#new" do
    it "should not raise an exception on instantiation" do
      lambda { config = ShipIt2::Config.new(@config_args) }.should_not raise_exception
    end

    it "should raise a run time exception if the config file passed in is missing" do
      lambda {
        config_args = { :config_file => "spec/resources/missing_shipit2_config.yaml" }
        config = ShipIt2::Config.new(config_args)
      }.should raise_exception
    end

    it "should return a new ShipIt2::Config object" do
      @config.should be_an_instance_of ShipIt2::Config
    end
  end

end
