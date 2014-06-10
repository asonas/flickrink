json.array!(@photos) do |photo|
  json.extract! photo, :id, :nsid, :username, :description, :url
  json.url photo_url(photo, format: :json)
end
