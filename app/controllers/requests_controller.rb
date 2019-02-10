class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # Redirect to step_1 if no route exists -> this slows down the landingpage video loading... why???
    redirect_to step_1_path unless Route.where(user: current_user.id).exists?

    @requests = policy_scope(Request).where(status: 0)
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
