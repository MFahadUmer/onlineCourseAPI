class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
    add_foreign_key :favourites, :users, column: :user_id
    add_foreign_key :favourites, :courses, column: :course_id
    add_index :favourites, [:user_id, :course_id], unique: true, name: 'favourites_index'
  end
end
