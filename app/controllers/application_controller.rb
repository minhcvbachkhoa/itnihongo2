class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "please-log-in"
      redirect_to log_in_url
    end
  end

  def search
    @q = Image.search params[:q]
    @images = @q.result(distinct: true).order_by_created_at.page params[:page]
  end
end
