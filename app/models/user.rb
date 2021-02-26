class User < ApplicationRecord
  def as_json(options={})
    {
        :first_name => self.first_name,
        :last_name => self.last_name,
        :username => self.last_name,
        :user_type => self.user_type,
        :email => self.email
    }
  end

  validates :first_name, :last_name, :username, :user_type, :email, :password, presence: true, length: { minimum: 10}
  validates :username, :email, uniqueness: { case_sensitive: false }
end
