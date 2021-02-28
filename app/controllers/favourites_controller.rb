class FavouritesController < ApplicationController
  def index
    render json: Favourite.all
  end

  def create
    favourite = Favourite.new(favourite_params)
    if favourite.save
      render json: favourite, status: 201
    else
      render json: favourite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    favourite = Favourite.find(params[:id]);
    favourite.destroy!

    head :no_content
  end

  private

  def favourite_params
    params.require(:favourite).permit(:user_id, :course_id)
  end
end
