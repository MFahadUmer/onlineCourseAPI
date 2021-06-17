class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :course_title
      t.string :course_details
      t.integer :course_author
      t.string :course_image
      t.string :course_price
      t.string :course_requirements
      t.string :course_difficulty

      t.timestamps
    end
    add_foreign_key :courses, :users, column: :course_author
  end
end
