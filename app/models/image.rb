class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  has_attached_file :content, :styles=>{:medium => "300x300>", :thumb => "100x100>"}
  validates_attachment_content_type :content, :content_type => %w(image/jpeg image/jpg image/png)
end