require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :quotes
  has_many :tags, :through => :quotes
  accepts_nested_attributes_for :quotes
  before_create :make_slug
  
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken


  validates :username, :presence   => true,
                    :uniqueness => true,
                    :length     => { :within => 3..40 },
                    :format     => { :with => Authentication.login_regex, :message => Authentication.bad_login_message }
  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :username, :password, :password_confirmation

  # Authenticates a user by their username name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(username, password)
    return nil if username.blank? || password.blank?
    u = find_by_username(username.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def username=(value)
    write_attribute :username, (value ? value.downcase : nil)
  end
  
  def tags 
   quotes.map(&:tags).flatten.compact.uniq
  end

  private
  def make_slug
    self.slug = to_slug(username)
  end


end
