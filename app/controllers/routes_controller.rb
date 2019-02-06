class RoutesController < ApplicationController
  def index
    policy_scope(Route)
    @routes = Route.all
  end

  def show
  end

  def create
    @route = Route.new
    authorize @route
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
