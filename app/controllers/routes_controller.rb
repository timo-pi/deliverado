class RoutesController < ApplicationController
  def index
    @routes = policy_scope(Route)
    @markers = @routes.map do |route|
      {
        lng: route.end_longitude,
        lat: route.end_latitude
      }
    end
  end

  def show
  end

  def new
    @route = Route.new
    authorize @route
  end

  def create
  end
end
