class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :taggings
  has_many :tags, :through => :taggings

  validates_presence_of :title, :message => "Invalid title, Your Post needs to have a title"
  validates_presence_of :content, :message => "Invalid content, Your Post needs to have content"
   validates_presence_of :author, :message => "Invalid author, Your Post needs to have an author"
end
