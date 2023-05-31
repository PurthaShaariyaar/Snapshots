class FavouritesController < ApplicationController
  def create
    @favourite = current_user.favourites.new(favourite_params)
      flash[:alert] = "You already liked this post"
    end
    redirect_to root_path
  end

  def destroy
    @favourite = current_user.favourites.find(params[:id])
    @favourite.destroy
    redirect_to root_path
  end

  def favourite_params
    params.require(:favourite).permit(:post_id)
  end

