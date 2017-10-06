require('minitest/autorun')
require_relative('../BarTab')

class TestBarTab < MiniTest::Test
    
  def setup
    @bar_tab = BarTab.new('Room 101')
	end
	
	def test_bar_tab_has_room
		assert_equal('Room 101', @bar_tab.room)
	end

	def test_bar_tab_has_amount
		assert_equal(0, @bar_tab.amount)
	end

	def test_can_add_amount_to_bar_tab
		@bar_tab.add(10)
		assert_equal(10, @bar_tab.amount)
	end

end