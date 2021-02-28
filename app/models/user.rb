class User < ApplicationRecord
  has_many :courses
  has_many :favourites

  def as_json(options={})
    {
        :user_id => self.id,
        :first_name => self.first_name,
        :last_name => self.last_name,
        :username => self.username,
        :user_type => self.user_type,
        :email => self.email
    }
  end

  validates :first_name, :last_name, :username, :email, :password, presence: true, length: { minimum: 5}
  validates :username, :email, uniqueness: { case_sensitive: false }
end