class Course < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'course_author'
  has_many :favourites

  def as_json(options={})
    {
        :course_id => self.id,
        :title => self.course_title,
        :details => self.course_details,
        :author => self.course_author,
        :requirements => self.course_requirements,
        :difficulty => self.course_difficulty,
        :image => self.course_image,
        :price => self.course_price,
        :date => self.created_at
    }
  end
end