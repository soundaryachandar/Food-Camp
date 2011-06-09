class FoodType < ActiveRecord::Base
  
attr_accessible :foodkind,:name,:location,:city,:tag_list  
  
  acts_as_taggable 
  #acts_as_taggable_on :foodkind  
  
end
