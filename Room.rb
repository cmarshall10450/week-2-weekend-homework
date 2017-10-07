require_relative('Bar')

class Room

	attr_reader :songs, :name, :guests, :capacity, :entry_fee, :total_to_spend, :bar

	def initialize(name, capacity, entry_fee = 0)
		@name = name
		@guests = []
		@songs = []
		@capacity = capacity
		@entry_fee = entry_fee
		@total_to_spend = 0
		@bar = Bar.new
	end

	def check_in_guest(guest)
		if @guests.count < @capacity
			@guests << guest
			guest.pay(@entry_fee)
			@total_to_spend += guest.money
			@bar.open_new_tab(guest)
		end
	end

	def check_out_guest(guest)
		@total_to_spend -= guest.money
		@guests.delete(guest)
		@bar.close_tab(guest)
	end

	def add_song(song)
		@songs << song
	end

	def remove_song(song)
		@songs.delete(song)
	end

	def compare_songs
		@songs.each { |song|
			@guests.each { |guest|
				puts guest.cheer if guest.favourite_song == song
			}
		}

		return
	end

end