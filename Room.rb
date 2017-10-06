require_relative('./Guest')
require_relative('./Song')

class Room

	attr_reader :songs, :name, :guests

	def initialize(name)
		@name = name
		@guests = []
		@songs = []
	end

	def check_in_guest(name)
		@guests << Guest.new(name)
	end

	def check_out_guest(name)
		for guest in @guests
			@guests.delete(guest) if guest.name == name
		end
	end

	def add_song(title, artist)
		@songs << Song.new(title, artist)
	end

	def remove_song(title)
		for song in @songs
			@songs.delete(song) if song.title== title
		end
	end

end