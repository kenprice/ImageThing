class Post < ActiveRecord::Base
	#Should belong to a user
	belongs_to :user
	validates :user_id, presence: true
	validates :title, presence: true, length: {maximum: 200}

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
	  :path => ":rails_root/public/system/posts/photos/:id/:style/:basename.:extension",
	  :url => "/system/posts/photos/:id/:style/:basename.:extension",
	  :default_url => "/images/:style/thumb.jpg"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  #descend from newest to oldest
  default_scope -> { order('created_at DESC') }
end
