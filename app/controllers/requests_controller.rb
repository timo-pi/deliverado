class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # Redirect to step_1 if no route exists -> this slows down the landingpage video loading... why???
    if Route.where(user: current_user.id).blank?
      flash[:alert] = "No commuter route found - please create a route"
    end
    # if !current_user.routes.first
    @requests = policy_scope(Request)
    if Route.where(user: current_user.id).blank?
      redirect_to step_1_path
    else Route.where(user: current_user.id).exists?
      @requests = @requests.near([current_user.routes.first.start_latitude, current_user.routes.first.start_longitude], current_user.routes.first.delivery_radius, units: :km).where(status: 0)

    end

    if params[:query].present? # query = die suche....
      @requests = @requests.where(size: params[:query]) # filer solar_system
    end
  # end
  end
   def show
    if user_signed_in?
      @request = Request.find(params[:id])
      authorize @request
      @markers = []
      @markers << {
        lng: @request.longitude,
        lat: @request.latitude,
        infoWindow: "Customer address"
      }
    end
  end
end
