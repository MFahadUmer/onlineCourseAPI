class FavouritesController < ApplicationController
  before_action :authorized, only: [:destroy]

  def show
    favourite = Favourite.find_by(user_id: params[:id])
    if favourite
      render json: favourite.course, status: 201
    else
      render json: favourite.error, status: 400
    end
  end

  def create
    favourite = Favourite.new(favourite_params)
    if favourite.save
      render json: favourite.course, status: 201
    else
      render json: favourite.errors, status: :unprocessable_entity
    end
  end

  def deletefavourite
    favourite = Favourite.destroy_by(delete_params)
    if favourite
      render json: 'Removed From Favourites'
    else
      render json: favourite.error, status: 401
    end
  end

  private

  def favourite_params
    params.require(:favourite).permit(:user_id, :course_id)
  end

  def delete_params
    params.require(:favourite).permit(:user_id, :course_id)
  end
end
