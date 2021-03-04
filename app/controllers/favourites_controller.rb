class FavouritesController < ApplicationController
  before_action :authorized, only: [:index]
  def index
    render json: Favourite.all
  end

  def show
    favourite = Favourite.where(user_id: params[:id])
    render json: favourite, status: 201
  end

  def create
    favourite = Favourite.new(favourite_params)
    if favourite.save
      render json: favourite, status: 201
    else
      render json: favourite.errors, status: :unprocessable_entity
    end
  end

  def deletefavourite
    Favourite.destroy_by(delete_params)

    render json: 'Removed From Favourites'
  end

  private

  def favourite_params
    params.require(:favourite).permit(:user_id, :course_id)
  end

  def delete_params
    params.require(:favourite).permit(:user_id, :course_id)
  end
end
