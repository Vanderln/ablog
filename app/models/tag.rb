class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :posts, :through => :taggings

  validates_presence_of :name, :message => "Invalid Name, Your tag needs to have some content"
  belongs_to :user
end
