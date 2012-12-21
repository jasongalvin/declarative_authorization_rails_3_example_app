class Comment < ActiveRecord::Base
  attr_accessible :article_id, :author_name, :content, :site_url, :user_id, :article
  belongs_to :article
  belongs_to :user
  validates_presence_of :author_name, :content
end
