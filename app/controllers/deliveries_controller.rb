class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :nav, :pickup]

  def create
    @delivery = Delivery.new
    @delivery.user_id = current_user.id
    @delivery.request_id = params[:request_id]
    @delivery.accepted!
    @delivery.request.accepted!
    authorize @delivery
      if @delivery.save
        redirect_to dashboard_path
        flash[:notice] = "You accepted a delivery request."
      end
  end

  def show
    @markers = []
    @markers << {

      lng: @delivery.request.longitude,
      lat: @delivery.request.latitude,
      infoWindow: "Customer address"
    }
  end

  def edit
   render layout: "signature"

  end

  def update
    if @delivery.update(signature: params[:delivery][:signature], status: "delivered")
      redirect_to delivery_path(@delivery), :notice => "Congratulations, you've just earned 5 €."
    else
      render :edit
    end
  end

  def pickup
    @delivery.pickedup!
    @qr_code = RQRCode::QRCode.new(@delivery.request.order_number, :size => 2, :level => :h )
  end

  def nav
    @delivery.ontheway!
    routes = @delivery.user.routes.first
    @markers = []
    @markers << [
      {
        lng: @delivery.request.longitude,
        lat: @delivery.request.latitude,
        infoWindow: "Customer address"
      }, {
        lng: routes.end_longitude,
        lat: routes.end_latitude,
        infoWindows: "Work address"
      }
    ]
     @markers.flatten!
     render layout: "fullscreen"
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
    authorize @delivery
  end

end
