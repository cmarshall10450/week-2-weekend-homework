class BarTab

	attr_reader :id

	def initialize(id, room_name)
		@id = id
		@for_room = room_name
		@amount = 0
	end


end