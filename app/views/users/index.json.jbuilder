json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :profile_img, :profile_bio
  json.url user_url(user, format: :json)
end
