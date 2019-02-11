class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :howto]

  def home
    # render 'new'
  end

  def howto
  end
end
