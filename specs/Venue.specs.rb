require('minitest/autorun')
require_relative('../Venue')

class TestVenue < MiniTest::Test

  def setup
    @venue = Venue.new()
	end

	def test_venue_has_bar
		assert(@venue.bar)
	end

end