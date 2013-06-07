class User < ActiveRecord::Base
  
  include BCrypt

  has_many :posts
  has_many :tags

  validates_uniqueness_of :email, :message => "You're already signed up."
  validates :email, :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates_presence_of :name, :message => "SAD. Why don't you have a name? You must have one."
  validates_presence_of :password, :message => "You need a password. Don't you understand boundaries?"

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password == password
      user
    else
      false
    end
  end 
end
