class Course < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'course_author'
  has_many :favourites
  has_many :favorited_by, through: :favourites, source: :user

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
  validates :course_title, :course_details, :course_author, :course_price, presence: true, length: { minimum: 4 }
end
