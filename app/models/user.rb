class User < ActiveRecord::Base
  validates(:password, :email, {presence: true} )
  validates(:email, {uniqueness: true} )

  has_many :categories, dependent: :destroy
  has_secure_password
end