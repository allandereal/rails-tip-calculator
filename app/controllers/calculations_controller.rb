class CalculationsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "password", only: [ :index ]

  def index
    @calculations = Calculation.paginate(page: params[:page], per_page: 5)
  end

  def new
    @calculation = Calculation.new
  end

  def create
    return redirect_to calculations_path if params[:commit] == "RESET"

    @calculation = Calculation.new(calculation_params)

    if @calculation.save
      render :new, status: :found
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def calculation_params
    params.expect(calculation: [ :bill, :tip, :people ])
  end
end
