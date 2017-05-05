class StaticPagesController < ApplicationController
  before_action :search
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  private
  def search
    @q = User.search params[:q]
    @users = @q.result(distinct: true).order(:id).page(params[:page])
  end
end
