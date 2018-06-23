class TicketsController < ActionController::Base
  def index

  end

  def new
    @ticket = Ticket.new
  end

  def create
    new_ticket = FreshdeskAdapter.create_ticket(params[:description], params[:email])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :email)
  end

end