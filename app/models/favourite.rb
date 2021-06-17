class Favourite < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :course, class_name: 'Course', foreign_key: 'course_id'

  def as_json(_options = {})
    {
      id: id,
      user_id: user_id,
      course_id: course_id
    }
  end
end
