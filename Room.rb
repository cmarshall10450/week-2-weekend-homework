class Room

	attr_reader :songs, :name, :guests

	def initialize(name)
		@name = name
		@guests = []
		@songs = []
	end

end