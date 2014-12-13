json.array!(@user) do |user|
  json.extract! user, :id, :email, :name, :profile_bio
  json.url user_url(user, format: :json)
end
