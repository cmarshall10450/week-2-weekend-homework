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

end