class User < ApplicationRecord
  has_many :courses, class_name: 'Course', foreign_key: 'course_author'
  has_many :favourites, class_name: 'Favourite', foreign_key: 'user_id'
  has_many :favourites_courses, through: :favourites, source: :course

  def as_json(_options = {})
    {
      user_id: id,
      first_name: first_name,
      last_name: last_name,
      username: username,
      user_type: user_type,
      email: email
    }
  end

  validates :first_name, :last_name, :username, :email, :password, presence: true, length: {minimum: 4}
  validates :username, :email, uniqueness: { case_sensitive: false }
end
