class StepsController < ApplicationController

  def step_1
    authorize :step, :step_1?
    @route = Route.new
  end

  def step_2
    authorize :step, :step_2?
    raise
  end

  def step_3
    authorize :step, :step_3?
  end

end
