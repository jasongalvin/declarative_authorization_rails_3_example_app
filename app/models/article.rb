class Article < ActiveRecord::Base
  attr_accessible :author_name, :content, :name, :user_id
  has_many :comments, :dependent => :destroy
  validates_presence_of :name, :content
  belongs_to :user
end
