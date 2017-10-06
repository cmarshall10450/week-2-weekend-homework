require('minitest/autorun')
require_relative('../Room')

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new('Room 101')
	end

	def test_room_has_name
		assert_equal('Room 101', @room.name)
	end

	def test_check_in_guest_to_room
		@room.check_in_guest('Chris')
		assert_equal(1, @room.guests.count)
	end

	def test_check_out_guest_from_room
		@room.check_in_guest('Chris')
		
		@room.check_out_guest('Chris')
		assert_equal(0, @room.guests.count)
	end

end