require_relative 'spec_helpers'

describe ShipIt2::Base do

  include Helpers

  describe "#new" do
    it "should raise an exception on instantiation" do
      expect { base = ShipIt2::Base.new }.to raise_exception
    end
  end

end
