require('minitest/autorun')
require_relative('../Song')

class TestSong < MiniTest::Test

  def setup
    @song = Song.new('99 Red Balloons', "Nina")
	end

	def test_song_has_name
		expected = '99 Red Balloons'
		result = @song.title
		assert_equal(expected, result)
	end

	def test_song_has_artist
		expected = 'Nina'
		result = @song.artist
		assert_equal(expected, result)
	end

end