require_relative 'spec_helpers'

describe ShipIt2::Base do

  include Helpers

  describe "#new" do
    it "should raise an exception on instantiation" do
      lambda { base = ShipIt2::Base.new }.should raise_exception
    end
  end

end
