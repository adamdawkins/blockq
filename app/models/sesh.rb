class Sesh
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  validates_presence_of :username
  attr_accessor :username
  
  def persisted?
     false
   end
end