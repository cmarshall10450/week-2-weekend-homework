require('minitest/autorun')
require_relative('../Bar')

class TestBar < MiniTest::Test

  def setup
		@bar = Bar.new()
	end

	def test_bar_has_list_of_tabs
		assert_equal(0, @bar.tabs.count)
	end

end