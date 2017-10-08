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

	def test_can_open_new_room
		@venue.open_room('Room 101', 10, 25)
		assert_equal(1, @venue.rooms.count)
	end

	def test_can_close_room
		guest = Guest.new('Chris', 100)
		@venue.open_room('Room 101', 10, 25)

		room = @venue.rooms[0]
		room.check_in_guest(guest)
		room.bar.add_to_tab(guest, 10)


		@venue.close_room(room.name)
		assert_equal(65, guest.money)
		assert_equal(10, @venue.revenue)
		assert_equal(0, @venue.rooms.count)
	end

	def test_can_collect_payment
		guest = Guest.new('Chris', 100)
		@venue.open_room('Room 101', 10, 25)

		room = @venue.rooms[0]
		room.check_in_guest(guest)
		room.bar.add_to_tab(guest, 10)

		@venue.collect_payment
		assert_equal(65, guest.money)
		assert_equal(10, @venue.revenue)
	end

end