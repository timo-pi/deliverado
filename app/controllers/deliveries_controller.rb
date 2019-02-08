class DeliveriesController < ApplicationController
  def update
  end

  def edit
    @delivery = Delivery.find(params[:id])
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
      raise
    end
  end
end
