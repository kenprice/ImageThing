json.user @user, :id, :email, :name, :profile_bio
json.url user_url(@user, format: :json)

json.posts(@allposts) do |post|
  json.extract! post, :id, :title, :caption, :photo_url
end