class FlightsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @flights = current_user.flights.order("date DESC")
  end

  def show
    @flight = current_user.flights.find(params[:id])
  end

  def new
    @flight = current_user.flights.new
  end

  def create
    flight = current_user.flights.new(flight_params)
    flight.save
    redirect_to flights_path
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])

    %w{origin destination date seat}.each do |param|
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
    params.require(:flight).permit(:origin, :destination, :date, :seat)
  end

end
