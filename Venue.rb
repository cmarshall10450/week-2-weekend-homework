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

	def create_bar_tab(room_name)
		@bar.open_new_tab(room_name)
	end

	def create_room(room_name, capacity, entry_fee = 0)
		add_room(room_name, capacity, entry_fee)
		create_bar_tab(room_name)
	end

end