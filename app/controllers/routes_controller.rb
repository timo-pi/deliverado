class RoutesController < ApplicationController
  def index
    policy_scope(Route)
    @routes = Route.all
    @markers = @routes.map do |route|
      {
        lng: route.end_longitude,
        lat: route.end_latitude
      }
    end
  end

  def show
  end

  def create
    @route.start_address = params[:route][:start_address]
    @route.end_address = params[:route][:end_address]
    @route.delivery_radius = params[:route][:delivery_radius]
    @route.name = params[:route][:name]
    @route.user_id = current_user.id
    if @route.save
      redirect_to routes_path
    else
      raise
    end
  end
end
