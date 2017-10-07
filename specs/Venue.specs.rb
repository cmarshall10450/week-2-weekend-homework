require('minitest/autorun')
require_relative('../Venue')
require_relative('../Guest')

class TestVenue < MiniTest::Test

  def setup
    @venue = Venue.new()
	end

	def test_venue_has_rooms
		assert_equal([], @venue.rooms)
	end

	def test_venue_has_revenue
		assert_equal(0, @venue.revenue)
	end

	def test_can_add_new_room
		@venue.add_room('Room 101', 10, 25)
		assert_equal(1, @venue.rooms.count)
	end

	def test_can_collect_payment
		guest = Guest.new('Chris', 100)
		@venue.add_room('Room 101', 10, 25)

		@venue.rooms[0].check_in_guest(guest)
		@venue.rooms[0].bar.add_to_tab(guest, 10)

		@venue.collect_payment
		assert_equal(65, guest.money)
		assert_equal(10, @venue.revenue)
	end

end