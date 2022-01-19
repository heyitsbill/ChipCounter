class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  has_many :room_users
  has_many :rooms, through: :room_users

  def name
    self.display_name
  end
end
