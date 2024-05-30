class BagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if current_user
      @bags = Bag.where.not(user_id: current_user.id)
    else
      @bags = Bag.all
    end
    if params[:query].present?
      @bags = @bags.search_by_brand(params[:query])
    else
      @bags = @bags.all
    end
  end

  def your_bags
    @bags = Bag.where(user_id: current_user.id)
  end

  def show
    @bag = Bag.find(params[:id])
    @request = Request.new
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user = current_user
    if @bag.save
      redirect_to bag_path(@bag)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bag_params
    params.require(:bag).permit(:brand, :description, :condition, :price_per_day, :picture_url)
  end
end
