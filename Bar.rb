require_relative('BarTab')

class Bar

	attr_reader :tabs

	def initialize
		@tabs = []
	end

	def open_new_tab_for(room)
		@tabs << BarTab.new(room.name)
	end

end