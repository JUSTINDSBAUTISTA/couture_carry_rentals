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
    @bag = Bag.find(params[:bag_id])
    @request = @bag.requests.build(request_params)
    if @request.save
      redirect_to @request
    else
      render 'new'
    end
  end

  private

  def request_params
    params.require(:request).permit(:status)
  end
end
