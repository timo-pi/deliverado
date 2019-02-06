class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @requests = policy_scope(Request)
  end

  def show
    if user_signed_in?
      @request = Request.find(params[:id])
    authorize @request
    end
  end
end
