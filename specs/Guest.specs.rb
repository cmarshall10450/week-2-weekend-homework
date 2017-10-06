require('minitest/autorun')
require_relative('../Guest')

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new('Chris')
	end

	def test_guest_has_name
		assert_equal('Chris', @guest.name)
	end

end