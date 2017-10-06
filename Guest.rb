class Guest

	attr_reader :name, :money

	def initialize(name, money)
		@name = name
		@money = money
	end

	def pay(amount)
		@money -= amount
	end

end