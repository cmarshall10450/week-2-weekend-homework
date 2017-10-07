require('minitest/autorun')
require_relative('../Bar')
require_relative('../BarTab')
require_relative('../Room')
require_relative('../Guest')

class TestBar < MiniTest::Test

  def setup
		@bar = Bar.new()
		@guest = Guest.new('Chris', 100)
		@room = Room.new('Room 101', 10, 25)
	end

	def test_bar_has_list_of_tabs
		assert_equal(0, @bar.tabs.count)
	end

	def test_open_new_tab
		@bar.open_new_tab(@guest)
		assert_equal(1, @bar.tabs.count)
	end

	def test_close_bar_tab__empty_tab
		@bar.open_new_tab(@guest)

		@bar.close_tab(@guest)
		assert_equal(0, @bar.tabs.count)
	end

	def test_close_bar_tab__not_empty_tab
		@bar.open_new_tab(@guest)
		@bar.add_to_tab(@guest, 10)

		@bar.close_tab(@guest)
		assert_equal(1, @bar.tabs.count)
	end

	def test_can_get_tab_for_guest
		@bar.open_new_tab(@guest)
		tab = @bar.get_tab_for_guest(@guest)

		assert(tab)
	end

	def test_can_add_amount_to_bar_tab_for_guest
		@bar.open_new_tab(@guest)
		@bar.add_to_tab(@guest, 10)
		amount = @bar.get_tab_for_guest(@guest).amount

		assert_equal(10, amount)
	end

end