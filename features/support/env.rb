require_relative File.join('..', '..', 'spec', 'helpers')

require 'open4'
require 'rspec'

class ShipItWorld
  include Helpers
end

World do
  ShipItWorld.new
end

After do |scenario|
  cleanup_test_versions
end
