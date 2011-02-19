class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :quotes, :through => :taggings
  
  def popularity
    quotes.length
  end
  

end
