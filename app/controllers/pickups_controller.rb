class PickupsController < ActionController::Base
  def index

  end

  def new
    @pickup = Pickup.new
  end

  def create
    @pickup = PickupAdapter.create_pickup(params[:pickup][:company], params[:pickup][:name], params[:pickup][:phone], params[:pickup][:email], params[:pickup][:residential], params[:pickup][:addressLines], params[:pickup][:cityTown], params[:pickup][:stateProvince], params[:pickup][:postalCode], params[:pickup][:countryCode], params[:pickup][:carrier], params[:pickup][:packageLocation], params[:pickup][:specialInstructions])

  end

  private

  def pickup_params
    params.require(:pickup).permit(:company, :name, :phone, :email, :residential, :addressLines, :cityTown, :stateProvince, :postalCode, :countryCode, :carrier, :specialInstructions, :packageLocation)
  end

end