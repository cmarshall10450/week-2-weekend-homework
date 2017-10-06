class Room

	attr_reader :songs, :name, :guests, :capacity, :entry_fee

	def initialize(name, capacity, entry_fee)
		@name = name
		@guests = []
		@songs = []
		@capacity = capacity
		@entry_fee = entry_fee
	end

	def check_in_guest(guest)
		if @guests.count < @capacity
			@guests << guest
			guest.pay(@entry_fee)
		end
	end

	def check_out_guest(guest)
		@guests.delete(guest)
	end

	def add_song(song)
		@songs << song
	end

	def remove_song(song)
		@songs.delete(song)
	end

	def find_guest_by_name(name)
		@guests.find { |guest|
			guest.name == name
		}
	end

end