require('minitest/autorun')
require_relative('../Guest')
require_relative('../Song')

class TestGuest < MiniTest::Test

  def setup
		@song = Song.new('Burning Ring of Fire', 'Johnny Cash')
    @guest = Guest.new('Chris', 100, @song)
	end

	def test_guest_has_name
		assert_equal('Chris', @guest.name)
	end

	def test_guest_has_favourite_song
		assert_equal(@song, @guest.favourite_song)
	end

	def test_guest_can_pay
		@guest.pay(50)
		assert_equal(50, @guest.money)
	end
end