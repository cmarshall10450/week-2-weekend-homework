require('minitest/autorun')
require_relative('../Bar')

class TestBar < MiniTest::Test

  def setup
		@bar = Bar.new()
  end

end