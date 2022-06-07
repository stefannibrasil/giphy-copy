json.extract! user, :id, :gifs, :created_at, :updated_at
json.url user_url(user, format: :json)
json.gifs do
  json.array!(user.gifs) do |gif|
    json.id gif.id
    json.url url_for(gif)
  end
end
