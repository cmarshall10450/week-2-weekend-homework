require_relative('./Guest')

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

end