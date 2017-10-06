require_relative('./Guest')
require_relative('./Song')

class Room

	attr_reader :songs, :name, :guests, :capacity, :entry_fee

	def initialize(name, capacity, entry_fee)
		@name = name
		@guests = []
		@songs = []
		@capacity = capacity
		@entry_fee = entry_fee
	end

	def check_in_guest(name)
		if @guests.count < @capacity
			@guests << Guest.new(name)
		end
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