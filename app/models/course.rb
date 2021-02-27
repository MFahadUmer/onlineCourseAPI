class Course < ApplicationRecord
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