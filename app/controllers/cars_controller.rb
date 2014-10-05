class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    @manufacturers = Manufacturer.all
  end

  def create
    @car = Car.new(car_params)
    binding.pry
    if @car.save
      redirect_to cars_path,
                  notice: "Car successfully created."
    else
      render "new"
    end
  end

  private

    def car_params

      params.require(:car).permit(
        :color,
        :year,
        :mileage,
        :description,
        :manufacturer_id
        )
    end
end
