class CoursesController < ApplicationController
  def index
    render json: Course.all
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: course, status: 201
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  def destroy
    course_id = Course.find(params[:id])
    course_id.destroy!

    head :no_content
  end

  private

  def course_params
    params.require(:course).permit(:course_title, :course_details, :course_author, :course_requirements, :course_difficulty)
  end
end
