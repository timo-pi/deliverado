class DashboardsController < ApplicationController
  # skip_after_action :verify_authorized, only: :index
  # skip_after_action :verify_policy_scoped, only: :index

  def index
    @my_requests = Request.all
  end
end
