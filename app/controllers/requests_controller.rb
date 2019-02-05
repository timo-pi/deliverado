class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @requests = Request.all
  end

  def show
    authorize @request
    if user_signed_in?
      @request = Request.find(params[:id])
    end
  end
end
