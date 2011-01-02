class User < ActiveRecord::Base
 has_many :quotes
 has_many :tags, :through => :quotes
 validates_presence_of :username, :message => "can't be blank"
 validates_uniqueness_of :username, :message => "must be unique"
end
