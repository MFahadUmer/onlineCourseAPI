class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :course_title
      t.string :course_details
      t.string :course_author
      t.string :course_requirements
      t.string :course_difficulty

      t.timestamps
    end
  end
end
