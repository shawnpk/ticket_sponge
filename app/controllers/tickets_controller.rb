class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @ticket = @project.tickets.build
  end

  def edit

  end

  def create
    @ticket = @project.tickets.new(ticket_params)
    @ticket.user = current_user

    if @ticket.save
      flash[:notice] = 'Ticket has been created.'
      redirect_to [@project, @ticket]
    else
      flash.now[:alert] = 'Ticket has not been created.'
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = 'Ticket has been updated.'
      redirect_to [@project, @ticket]
    else
      flash.now[:alert] = 'Ticket has not been updated.'
      render :edit
    end
  end

  def destroy
    @ticket.delete
    flash[:notice] = 'Ticket has been deleted.'

    redirect_to @project
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_ticket
      @ticket = @project.tickets.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:name, :description)
    end
end
