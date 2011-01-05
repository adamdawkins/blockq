class Quote < ActiveRecord::Base
  belongs_to :user
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  validates_presence_of :text, :message => "can't be blank"
  validates_presence_of :user_id
  attr_accessor :tag_names
  
  before_save :cleanup_text
  after_save :assign_tags
  
  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end
  
  private 
  
  def cleanup_text
   text.gsub!(/\A"/, '')
   text.gsub!(/\A“/, '')
   text.gsub!(/"\Z/, '')
   text.gsub!(/”\Z/, '')
  end
  
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/,+/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end
end
