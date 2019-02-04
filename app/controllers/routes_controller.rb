class RoutesController < ApplicationController
  def index
    @routes = policy_scope(Route)
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
