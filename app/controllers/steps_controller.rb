class StepsController < ApplicationController

  def step_1
    authorize :step, :step_1?
    @route = Route.new
    @markers = []
    @markers << {

      lng: 11.424444,
      lat: 48.765556
    }
  end

  def step_2
    authorize :step, :step_2?
    result = Geocoder.search(params[:route][:start_address])
    @markers = []
    @markers << {

      lng: result.first.coordinates.second,
      lat: result.first.coordinates.first
    }
  end

  def step_3
    authorize :step, :step_3?
    result_start = Geocoder.search(params[:route][:start_address])
    @markers = []
    @markers << {

      lng: result_start.first.coordinates.second,
      lat: result_start.first.coordinates.first
    }
    result_end = Geocoder.search(params[:route][:end_address])
    @markers << {

      lng: result_end.first.coordinates.second,
      lat: result_end.first.coordinates.first
    }
  end

end
