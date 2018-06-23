class TicketsController < ActionController::Base
  def index

  end

  def new
    @ticket = Ticket.new
  end

  def create
    description = params[:ticket][:description]
    email = params[:ticket][:email]
    @ticket = FreshdeskAdapter.create_ticket(description, email)

  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :email)
  end

end