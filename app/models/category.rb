class Category < ActiveRecord::Base
  validates(:name, :icon, :user_id, {presence: true} )
  has_many :entries, dependent: :destroy
end