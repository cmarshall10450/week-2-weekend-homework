require_relative('Bar')

class Venue

	attr_reader :bar, :rooms

	def initialize()
	  @bar = Bar.new()
		@rooms = []
	end

end