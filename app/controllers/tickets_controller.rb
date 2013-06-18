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
      flash[:notice] = "An error occured!"
      redirect_to new_ticket_path
    end
  end

  def show
    begin
      @ticket = Ticket.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
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
      flash[:notice] = "An error occured!"
      render 'edit'
    end
  end

  def destroy
    ticket = Ticket.find(params[:id])

    ticket.destroy
    redirect_to root_path
  end
  
  def resolve
    ticket = Ticket.find(params[:id])

    ticket.update_attributes(resolved: 1)
    redirect_to root_path
  end

  def stats
    @tickets = Ticket.all
    @resolved = Ticket.where(resolved: 1)
    @unresolved = Ticket.where(resolved: 0)
  end
end