class Guest

	attr_reader :name, :money, :favourite_song

	def initialize(name, money, favourite_song = '')
		@name = name
		@money = money
		@favourite_song = favourite_song
	end

	def pay(amount)
		@money -= amount
	end

	def cheer
		return 'Whoo!'
	end

end