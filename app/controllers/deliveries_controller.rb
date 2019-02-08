class DeliveriesController < ApplicationController
<<<<<<< HEAD
  def update
  end

  def edit
    @delivery = Delivery.find(params[:id])
    authorize @delivery
=======
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
>>>>>>> d0c2603c3a54e432110d541a6feed42e346e8c7a
  end
end
