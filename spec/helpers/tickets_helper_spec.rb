require "spec_helper"

describe TicketsHelper do
	include TicketsHelper
	
	describe ".resolved_at" do
		it "displays no when resolved is false" do
			@ticket = Ticket.new(resolved: 0)
			resolved_at(@ticket).should eq "No"
		end

		it "displays yes when resolved is true" do
			@ticket = Ticket.new(resolved: 1)
			@ticket.updated_at = Time.now
			resolved_at(@ticket).should eq "less than a minute ago" 
		end
	end

	describe ".resolved?" do
		it "displays yes when resolved is true" do
			@ticket = Ticket.new(resolved: 1)
			resolved?(@ticket).should eq "Yes"
		end

		it "displays no when resolved is false" do
			@ticket = Ticket.new(resolved: 0)
			resolved?(@ticket).should eq "No"
		end
	end
end