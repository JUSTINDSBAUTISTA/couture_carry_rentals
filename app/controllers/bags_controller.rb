class BagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @bags = Bag.all
  end

  def show
    @bag = Bag.find(params[:id])
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.save

    redirect_to bag_path(@bag)
  end

  private

  def bag_params
    params.require(:bag).permit(:brand, :description, :condition, :price_per_day, :picture_url)
  end
end
