class ImagesController < ApplicationController
  before_action :logged_in_user, expect: [:show, :index]
  before_action :correct_user, only: [:destroy, :edit, :update]

  def index
    @images = Image.all
  end

  def show
    @image = Image.find_by id: params[:id]
    unless @image
      flash[:error] = t "image-not-found"
      redirect_to root_url
    end
  end

  def new
    @image = Image.new
    @categories = Category.all
  end

  def create
    @image = Image.new image_params
    @image.user_id = current_user.id
    if @image.save
      flash[:success] = t "image.message.success_created_image"
      redirect_to @image
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @image.update_attributes image_params
      flash[:success] = t "image.message.success_updated_image"
      redirect_to @image
    else
      render :edit
    end
  end

  def destroy
    @image.destroy
    flash[:success] = t "image.message.success_deleted_image"
    redirect_to root_url
  end

  private

  def image_params
    params.require(:image).permit :user_id, :image, :address, :category_id ,
      :description, :created_at, :image_cache
  end

  def correct_user
    @image = current_user.images.find_by id: params[:id]
    redirect_to root_url unless @image
  end
end
