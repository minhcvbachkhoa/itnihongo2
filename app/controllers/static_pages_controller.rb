class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @image = current_user.images.build
      @images = current_user.feed.paginate page: params[:page]
    end
  end

  def about
  end

end
