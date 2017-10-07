require_relative('BarTab')

class Bar

	attr_reader :tabs

	def initialize
		@tabs = []
	end

	def open_new_tab(guest)
		@tabs << BarTab.new(guest)
	end

	def close_tab(guest)
		tab = get_tab_for_guest(guest)
		@tabs.delete(tab) if tab.amount == 0
	end

	def add_to_tab(guest, amount)
		tab = get_tab_for_guest(guest)

		tab.add(amount)
	end

	def get_tab_for_guest(guest)
		return @tabs.find { |tab|
			tab.guest == guest
		}
	end

end