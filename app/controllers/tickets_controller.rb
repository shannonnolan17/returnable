class TicketsController < ActionController::Base
  def index

  end

  def create
    @ticket = FreshdeskAdapter.create_ticket(params[:subject], params[:description], params[:email])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:subject, :description, :price, :negotiable, :category_id, :status, :image)
  end

end