class StoresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @stores = policy_scope(Store)
  end

  # def show
  #   if user_signed_in?
  #     @store = Store.find(params[:id])
  #   authorize @store
  #   end
  # end
end
