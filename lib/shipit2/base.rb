class ShipIt2::Base

  include ShipIt2

  def initialize(args={})
    raise ShipIt2::NotImplementedError.new "ShipIt2::Base is an abstract class and should not be instaciated"
  end

end
