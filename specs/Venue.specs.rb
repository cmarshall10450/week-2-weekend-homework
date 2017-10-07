require('minitest/autorun')
require_relative('../Venue')

class TestVenue < MiniTest::Test

  def setup
    @venue = Venue.new()
	end

	def test_venue_has_bar
		assert(@venue.bar)
	end

	def test_venue_has_rooms
		assert_equal([], @venue.rooms)
	end

	def test_can_add_new_room
		@venue.add_room('Room 101', 10, 25)
		assert_equal(1, @venue.rooms.count)
	end

	def test_can_add_bar_tab_to_bar
		@venue.create_bar_tab('Room 101')
		assert_equal(1, @venue.bar.tabs.count)
	end

	def test_can_create_new_room
		@venue.create_room('Room 101', 10, 25)

		assert_equal(1, @venue.rooms.count)
		assert_equal(1, @venue.bar.tabs.count)
		assert_equal(@venue.rooms.count, @venue.bar.tabs.count)
	end

end