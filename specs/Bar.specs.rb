require('minitest/autorun')
require_relative('../Bar')
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
		@bar.open_new_tab_for(@room)
		assert_equal(1, @bar.tabs.count)
	end



end