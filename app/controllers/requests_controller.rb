class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @requests = policy_scope(Request)

    if params[:query].present? # query = die suche....
      @requests = @requests.where(size: params[:query]) # filer solar_system
    end
  end

  def show
    if user_signed_in?
      @request = Request.find(params[:id])
    authorize @request
    @markers = []
    @markers << {

      lng: @request.longitude,
      lat: @request.latitude
    }
    end
  end
end
