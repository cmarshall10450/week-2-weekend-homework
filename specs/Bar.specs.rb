require('minitest/autorun')
require_relative('../Bar')
require_relative('../BarTab')
require_relative('../Room')

class TestBar < MiniTest::Test

  def setup
		@bar = Bar.new()
		@room = Room.new('Room 101', 10, 25)
	end

	def test_bar_has_list_of_tabs
		assert_equal(0, @bar.tabs.count)
	end

	def test_open_new_tab
		@bar.open_new_tab('Room 101')
		assert_equal(1, @bar.tabs.count)
	end

	def test_close_bar_tab__empty_tab
		@bar.open_new_tab('Room 101')

		@bar.close_tab('Room 101')
		assert_equal(0, @bar.tabs.count)
	end

	def test_close_bar_tab__not_empty_tab
		@bar.open_new_tab('Room 101')
		@bar.add_to_tab('Room 101', 10)

		@bar.close_tab('Room 101')
		assert_equal(1, @bar.tabs.count)
	end

	def test_can_get_tab_for_room_by_name
		@bar.open_new_tab('Room 101')
		tab = @bar.get_tab_by_room_name('Room 101')

		assert(tab)
	end

	def test_can_add_amount_to_bar_tab_by_room_name
		@bar.open_new_tab('Room 101')
		@bar.add_to_tab('Room 101', 10)
		amount = @bar.get_tab_by_room_name('Room 101').amount

		assert_equal(10, amount)
	end

end