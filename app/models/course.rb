class Course < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'course_author'
  has_many :favourites

  def as_json(_options = {})
    {
      course_id: id,
      title: course_title,
      details: course_details,
      author: course_author,
      requirements: course_requirements,
      difficulty: course_difficulty,
      image: course_image,
      price: course_price,
      date: created_at
    }
  end
end
