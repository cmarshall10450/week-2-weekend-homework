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
		tab = get_tab_by_room_name(room.name)
		@tabs.delete(tab)
	end

	def get_tab_by_room_name(name)
		return @tabs.find { |tab|
			tab.room == name
		}
	end

end