module TicketsHelper

	def resolved_at(ticket)
		if ticket.resolved == 1
			time_ago_in_words(ticket.updated_at) +
			" ago"
		else
			"No"
		end
	end

	def resolved?(ticket)
		if ticket.resolved == 1
			"Yes"
		else
			"No"
		end
	end
end
