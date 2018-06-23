class LabelsController < ActionController::Base
  def index

  end

  def new
    @label = Label.new
  end

  def create
    @label = PBLabelAdapter.new(params)

  end

  private

  def Label_params
    params.require(:label).permit(:description, :email)
  end

end