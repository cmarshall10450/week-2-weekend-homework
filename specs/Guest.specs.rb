require('minitest/autorun')
require_relative('../Guest')

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new('Chris', 100)
	end

	def test_guest_has_name
		assert_equal('Chris', @guest.name)
	end

	def test_guest_can_pay
		@guest.pay(50)
		assert_equal(50, @guest.money)
	end
end