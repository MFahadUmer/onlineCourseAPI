class User < ApplicationRecord
  has_many :courses
  has_many :favourites

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

  validates :first_name, :last_name, :username, :email, :password, presence: true, length: { minimum: 5 }
  validates :username, :email, uniqueness: { case_sensitive: false }
end
