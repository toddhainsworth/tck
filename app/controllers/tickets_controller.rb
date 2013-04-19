class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end
  
  def show
    @ticket = Ticket.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end
end
