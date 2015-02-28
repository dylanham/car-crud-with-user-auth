class CarsController < ApplicationController
  before_action :set_car, only:[:show, :edit, :update]
  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    car = Car.new(car_params)
    if car.save
      flash[:notice] = "You succesfully created a new car"
      redirect_to car_path(car)
    else
      @car = car
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      flash[:notice] = "You successfully updated your car"
      redirect_to car_path(@car)
    else
      render :edit
    end
  end

  def destroy
    Car.find(params[:id]).destroy
    flash[:notice] = "Your car just blew up!"
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year)
  end

  def set_car
    @car = Car.find(params[:id])
  end
  
end
