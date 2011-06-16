# Load the normal Rails helper
require File.expand_path(File.dirname(__FILE__) + '/../../../../test/test_helper')

# Ensure that we are using the temporary fixture path
Engines::Testing.set_fixture_path

module CustomHelpers
  def getting(action)
    context "when getting '/#{action}'" do
      setup { get action, :id => 1 }
      yield
    end
  end
end

class Test::Unit::TestCase
  extend CustomHelpers
end
