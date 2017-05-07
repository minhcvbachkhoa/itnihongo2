json.images do
  json.array!(@images) do |image|
    json.search_sugesstion "Address: #{image.address}"
    json.url image_path(image.id)
  end
end