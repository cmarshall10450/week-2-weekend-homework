require('minitest/autorun')
require_relative('../BarTab')
require_relative('../Guest')

class TestBarTab < MiniTest::Test
    
  def setup
		@guest = Guest.new('Chris', 100)
    @bar_tab = BarTab.new(@guest)
	end
	
	def test_bar_tab_has_guest
		assert_equal(@guest, @bar_tab.guest)
	end

	def test_bar_tab_has_amount
		assert_equal(0, @bar_tab.amount)
	end

	def test_can_add_amount_to_bar_tab
		@bar_tab.add(10)
		assert_equal(10, @bar_tab.amount)
	end

end