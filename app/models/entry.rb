class Entry < ActiveRecord::Base 
  validates(:name, :category_id, {presence: true} )

end