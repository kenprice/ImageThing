json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :name, :profile_img, :profile_bio
  json.url user_url(user, format: :json)
end
