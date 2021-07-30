class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant successfully created"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end
  
end
