class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update]
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
      raise
    end
  end

  def show
    @markers = []
    @markers << {

      lng: @delivery.request.longitude,
      lat: @delivery.request.latitude
    }
  end

  def edit
  end

  def update
    if @delivery.update(signature: params[:delivery][:signature], status: "delivered")
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
    authorize @delivery
  end

end
