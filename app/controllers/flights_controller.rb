class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def new
    @flight = Flight.new
  end

  def create
    flight = Flight.new(flight_params)
    flight.save
    redirect_to flights_path
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])

    %w{origin destination date class}.each do |param|
      if params[:flight][param].blank?
        params[:flight][param].delete
      end
    end

    @flight.update(flight_params)
    redirect_to flights_path
  end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.delete
    redirect_to blogs_path
  end

  private
  def flight_params
    params.require(:flight).permit(:origin, :destination, :date, :class)
  end

end
