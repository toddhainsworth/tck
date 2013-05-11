require "spec_helper"

describe TicketsHelper do
	include TicketsHelper
	describe ".resolved_at" do
		it "display no when resolved is false" do
			@ticket = Ticket.new(resolved: 0)
			resolved_at(@ticket).should eq "No"
		end

		it "displays yes when resolved is true" do
			@ticket = Ticket.new(resolved: 1)
			@ticket.created_at = Time.now
			resolved_at(@ticket).should eq "less than a minute ago" 
		end
	end
end