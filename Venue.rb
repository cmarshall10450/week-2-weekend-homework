require_relative('Bar')
require_relative('Room')

class Venue

	attr_reader :bar, :rooms

	def initialize()
	  @bar = Bar.new()
		@rooms = []
	end

	def add_room(room_name, capacity, entry_fee = 0)
		@rooms << Room.new(room_name, capacity, entry_fee)
	end

end