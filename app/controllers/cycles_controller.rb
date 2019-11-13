class CyclesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cycles = Cycle.all
    # @cycle = Cycle.find(params[:id])
  end

  def show
    @cycle = Cycle.find(params[:id])
    @booking = Booking.new
  end

  def create
    @cycle = Cycle.new()
    if @cycle.save
      redirect_to cycle_path
    else
      render 'new'
    end
  end

  def new
    @cycle = Cycle.new
  end

  def destroy
    @cycle = Cycle.find(params[:id])
    @cycle.destroy
    redirect_to '/cycles/new', :notice => "Your cycle has been deleted"
  end

  private
  def cycle_params
    params.require(:cycle).permit(:brand, :color, :category, :price, :description, :location, :photo)
  end
end
