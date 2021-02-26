class Course < ApplicationRecord
  def as_json(options={})
    {
        :title => self.course_title,
        :details => self.course_details,
        :author => self.course_author,
        :requirements => self.course_requirements,
        :difficulty => self.course_difficulty,
        :date => self.created_at
    }
  end

  validates :course_title, :course_difficulty, :course_details, :course_author, presence: true, length: { minimum: 10 }
end
