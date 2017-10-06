require_relative('BarTab')

class Bar

	attr_reader :tabs

	def initialize
		@tabs = []
	end

	def open_new_tab(room)
		@tabs << BarTab.new(room.name)
	end

	def close_tab(room)
		tab = @tabs.find { |tab|
			tab.room == room.name
		}

		@tabs.delete(tab)
	end

end