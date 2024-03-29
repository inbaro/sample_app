class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destory]
  before_filter :correct_user, only: :destory

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destory
  end

  private

  def correct_user
    @micropost = current_user.microposts.find(params[:id])
  rescue
    redirect_to root_path
  end
end
