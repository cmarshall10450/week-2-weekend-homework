require_relative('Bar')
require_relative('Room')

class Venue

	attr_reader :bar, :rooms, :revenue

	def initialize
		@rooms = []
		@revenue = 0
	end

	def open_room(room_name, capacity, entry_fee = 0)
		@rooms << Room.new(room_name, capacity, entry_fee)
	end

	def close_room(room_name)
		room = @rooms.find { |room|
			room.name == room_name
		}

		collect_payment_from_room(room)
		@rooms.delete(room)
	end

	def collect_payment_from_room(room)
		room.guests.each { |guest|
			tab = room.bar.get_tab_for_guest(guest)

			guest.pay(tab.amount)
			@revenue += tab.amount
		}
	end

	def collect_payment
		@rooms.each { |room|
			collect_payment_from_room(room)
		}
	end

end