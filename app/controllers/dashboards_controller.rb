class DashboardsController < ApplicationController
  skip_after_action :verify_authorized, only: :index
  skip_after_action :verify_policy_scoped, only: :index

  def index
    if Delivery.where(user: current_user.id).where(status: "delivered").exists?
      flash[:notice] = "You have no deliveries"
    elsif Delivery.where(user: current_user.id).blank?
      flash[:notice] = "You have accepted deliveries!"
    end
    @my_deliveries = Delivery.where(user_id: current_user.id)
  end
end

