class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @user = @request.bag.user
  end

  def new
    @request = Request.new
    @bag = Bag.find(params[:bag_id])

  end

  def create
    @request = Request.new(request_params)
    @request.status = "pending"
    @bag = Bag.find(params[:bag_id])
    @request.bag = @bag
    @request.user = current_user
    if @request.save
      redirect_to requests_path, notice: "Request was successfully created!"
    else
      render "bags/show", status: :unprocessable_entity
    end
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date)
  end
end
