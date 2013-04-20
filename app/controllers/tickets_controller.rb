class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params[:ticket])

    if @ticket.save
      redirect_to ticket_path @ticket.id
    else
      redirect_to new_ticket_path
    end
  end

  def show
    @ticket = Ticket.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end

  def edit
    @ticket = Ticket.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update_attributes(params[:ticket]) 
      redirect_to ticket_path(@ticket.id)
    else
      render 'edit'
    end
  end

  def destroy
    ticket = Ticket.find(params[:id])

    ticket.destroy
    redirect_to root_path
  end
end
