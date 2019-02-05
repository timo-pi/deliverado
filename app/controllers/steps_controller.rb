class StepsController < ApplicationController

  def step_1
    authorize :step, :step_1?
  end

  def step_2

  end

  def step_3

  end

end
