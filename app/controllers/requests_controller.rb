class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
    @bag = Bag.new
  end

  def create
    @request = Request.new(@bag[request_params])
    @request.save

    redirect_to request
  end

  private

  def request_params
    params.require(:request).permit(:status)
  end
end
