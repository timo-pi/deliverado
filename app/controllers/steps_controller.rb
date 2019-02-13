class StepsController < ApplicationController
  def step_1
    authorize :step, :step_1?
    @route = Route.new

    # first_result = Geocoder.search("Ingolstadt")
    # @markers = []
    # @markers << {

      # lng: first_result.first.coordinates.second,
      # lat: first_result.first.coordinates.first
      # }
  end

  def step_2
    authorize :step, :step_2?
    if params[:route][:start_address].empty? || params[:route][:name].empty?
      render :step_1
    else
      result = Geocoder.search(params[:route][:start_address])
      @markers = []
      @markers << {

        lng: result.first.coordinates.second,
        lat: result.first.coordinates.first,
        infoWindow: "Home Address"
      }
    end
  end

  def step_3
    authorize :step, :step_3?
    if params[:route][:end_address].empty?
      render :step_2
    else
      result_start = Geocoder.search(params[:route][:start_address])
      @markers = []
      @markers << {

        lng: result_start.first.coordinates.second,
        lat: result_start.first.coordinates.first,
        infoWindow: "Home Address"
      }
      result_end = Geocoder.search(params[:route][:end_address])
      @markers << {

        lng: result_end.first.coordinates.second,
        lat: result_end.first.coordinates.first,
        infoWindow: "Work Address"
      }
    end
  end
end
