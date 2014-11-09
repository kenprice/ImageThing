module PostsHelper

	def adjust_brightness level, post, id
		image_path = "#{Rails.root}/public/system/posts/photos/#{post.id}/original/#{post.photo_file_name}"
		#mogrify = MiniMagick::Tool::Mogrify.new
		#mogrify << "-modulate 150, 100, 100 " + image_path
		#mogrify.call # executes
		
		system "mogrify -brightness-contrast " + level.to_s + "% " + image_path

		post.photo.reprocess!

  #original_style_name = "original_#{record.image_file_name}"
  #new_style_name = "small_download_#{record.image_file_name}"
  #image_path = "#{Rails.root}/private/images/galleries/#{record.gallery_id}/#{record.id}"
  #system "cd #{image_path} && cp #{original_style_name} #{new_style_name} && mogrify -resize 600x600 #{new_style_name}"
	end

end
