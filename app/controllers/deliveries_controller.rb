class DeliveriesController < ApplicationController
  def update
  end

  def edit
    @delivery = Delivery.find(params[:id])
    authorize @delivery
  end
end
