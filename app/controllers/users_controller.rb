class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def userfavourite
    user = User.find(params[:id])
    if user
      render json: user.favourites_courses, status: 200
    else
      render json: 'No Favourite Courses', status: 401
    end
  end

  def authorcourses
    user = User.find(params[:id])
    if user
      render json: user.courses, status: 200
    else
      render json: 'No Courses Found by You.', status: 401
    end
  end

  def login
    user = User.find_by(user_login_params)
    if user
      render json: user, status: 200
    else
      render json: 'Incorrect Details.', status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :user_type, :password)
  end

  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end
