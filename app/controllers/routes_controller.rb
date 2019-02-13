class RoutesController < ApplicationController
  def index
    if Route.where(user: current_user.id).blank?
      flash[:alert] = "No commuter route found - please create a route"
    end
    @routes = policy_scope(Route)
    @markers = @routes.map do |route|
      {
        lng: route.start_longitude,
        lat: route.start_latitude,
        infoWindow: "Home address"
      }
    end
    @routes.map do |route|
      @markers << {
        lng: route.end_longitude,
        lat: route.end_latitude,
        infoWindow: "Work address"
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
    if @route.save
      flash[:notice] = "Your route has been created!"
    end
    redirect_to routes_path
  end

  def destroy
    @route = Route.find(params[:id])
    authorize @route
    @route.destroy
    redirect_to routes_path
  end

end
