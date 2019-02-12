class DeliveriesController < ApplicationController
  def show
    @delivery = Delivery.find(params[:id])
    authorize @delivery
  end

  def update
  end

  def edit
    @delivery = Delivery.find_by(request_id: params[:id])
    authorize @delivery
  end

  def create
    @delivery = Delivery.new
    @delivery.user_id = current_user.id
    @delivery.request_id = params[:request_id]
    @delivery.accepted!
    @delivery.request.accepted!
    authorize @delivery
    if @delivery.save
      redirect_to requests_path
    else
    end
  end

  def nav
    @delivery = Delivery.find(params[:id])
    authorize @delivery
    routes = @delivery.user.routes.first
    @markers = []
    @markers << [
      {
        lng: routes.start_longitude,
        lat:routes.start_latitude
      },
      {
        lng: @delivery.request.longitude,
        lat: @delivery.request.latitude
      }, {
        lng: routes.end_longitude,
        lat: routes.end_latitude
      }
    ]
     @markers.flatten!
     render layout: "fullscreen"
  end

end
