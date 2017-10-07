require('minitest/autorun')
require_relative('../Room')
require_relative('../Guest')
require_relative('../Song')

class TestRoom < MiniTest::Test

  def setup
		@guest = Guest.new('Chris', 100)
    @room = Room.new('Room 101', 10, 25)
	end

	def test_room_has_name
		assert_equal('Room 101', @room.name)
	end

	def test_room_has_capacity
		assert_equal(10, @room.capacity)
	end

	def test_room_has_entry_fee
		assert_equal(25, @room.entry_fee)
	end

	def test_room_has_total_to_spend
		assert_equal(0, @room.total_to_spend)
	end

	def test_room_has_bar
		assert(@room.bar)
	end

	def test_room_total_to_spend_is_increased_when_guest_checked_in

		@room.check_in_guest(@guest)

		assert_equal(75, @room.total_to_spend)
	end

	def test_check_in_guest_to_room
		@room.check_in_guest(@guest)
		assert_equal(1, @room.guests.count)
	end

	def test_guest_pays_entry_fee_when_checked_in
		@room.check_in_guest(@guest)

		assert_equal(75, @guest.money)
	end

	def test_check_out_guest_from_room
		@room.check_in_guest(@guest)
		
		@room.check_out_guest(@guest)
		assert_equal(0, @room.guests.count)
	end

	def test_can_open_new_bar_tab_when_guest_is_checked_in
		@room.check_in_guest(@guest)

		assert_equal(1, @room.bar.tabs.count)
	end

	def test_bar_tab_is_closed_when_guest_is_check_out_of_room
		@room.check_in_guest(@guest)

		@room.check_out_guest(@guest)
		assert_equal(0, @room.bar.tabs.count)
	end

	def test_add_song_to_room
		song = Song.new('99 Red Balloons', 'Nina')
		@room.add_song(song)

		assert_equal(1, @room.songs.count)
	end

	def test_remove_song_from_room
		song = Song.new('99 Red Balloons', 'Nina')
		@room.add_song(song)

		@room.remove_song(song)
		assert_equal(0, @room.songs.count)
	end

	def test_guest_is_not_added_if_room_capacity_exceeded
		10.times {
			@room.check_in_guest(@guest)
		}

		@room.check_in_guest(@guest)
		assert_equal(10, @room.guests.count)
	end

	def test_guest_cheers_when_favourite_song_is_in_room
		song = Song.new('Burning Ring of Fire', 'Johnny Cash')
		guest = Guest.new('Chris', 100, song)

		@room.check_in_guest(guest)
		@room.add_song(song)

		assert_nil(@room.compare_songs)
	end

end