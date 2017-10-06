class BarTab

	attr_reader :id, :room, :amount

	def initialize(id, room)
		@id = id
		@room = room
		@amount = 0
	end

	def add(amount)
		@amount += amount
	end

end