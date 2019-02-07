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
    @route = Route.find(params[:id])
    authorize @route
  end

  def create
    @route = Route.new
    @route.start_address = params[:route][:start_address]
    @route.end_address = params[:route][:end_address]
    @route.delivery_radius = params[:route][:delivery_radius]
    @route.name = params[:route][:name]
    @route.user_id = current_user.id
    authorize @route
    @route.save
    redirect_to routes_path
  end

  def destroy
    @route = Route.find(params[:id])
    authorize @route
    @route.destroy
    redirect_to routes_path
  end

end
