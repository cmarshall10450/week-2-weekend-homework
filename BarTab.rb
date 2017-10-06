class BarTab

	attr_reader :id, :room, :amount

	def initialize(room)
		@room = room
		@amount = 0
	end

	def add(amount)
		@amount += amount
	end

end