class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true

  def name
    self.display_name
  end
end
