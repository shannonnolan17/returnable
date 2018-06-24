class PickupController < ActionController::Base
  def index

  end

  def new
    @pickup = Label.new
  end

  def create
    @pickup = PblabelAdapter.create_label(params[:label][:company], params[:label][:name], params[:label][:phone], params[:label][:email], params[:label][:residential], params[:label][:addressLines], params[:label][:cityTown], params[:label][:stateProvince], params[:label][:postalCode], params[:label][:countryCode])

  end

  private

  def label_params
    params.require(:label).permit(:company, :name, :phone, :email, :residential, :addressLines, :cityTown, :stateProvince, :postalCode, :countryCode)
  end

end