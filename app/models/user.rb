class User < ApplicationRecord

  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates_date :born_on, :between => [100.years.ago, 15.years.ago]
  validates :username, :email, presence: true, uniqueness: true, length: { in: 2..20 }
  has_secure_password
  validates :password, presence: true, length: { in: 2..20 }

end
