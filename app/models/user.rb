class User < ApplicationRecord
  has_many :potholes
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates_date :born_on, :between => [100.years.ago, 15.years.ago]
  validates :username, presence: true, uniqueness: true, length: { in: 2..20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { in: 2..20 },
    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true, length: { in: 2..20 }

end
