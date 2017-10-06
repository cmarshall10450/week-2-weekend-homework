require('minitest/autorun')
require_relative('../BarTab')

class TestBarTab < MiniTest::Test
    
  def setup
    @barTab = BarTab.new(1, 'Room 101')
	end

	def test_bar_tab_has_id
		assert_equal(1, @barTab.id)
	end
	
	def test_bar_tab_has_room
		assert_equal('Room 101', @barTab.room)
	end

end