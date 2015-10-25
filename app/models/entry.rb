class Entry < ActiveRecord::Base 
  validates(:starttime, :endtime, :category_id, {presence: true} )

end