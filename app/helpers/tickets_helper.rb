module TicketsHelper

	def resolved_at(ticket)
		if ticket.resolved == 1
			time_ago_in_words(ticket.created_at) +
			" ago"
		else
			"No"
		end
	end
end
