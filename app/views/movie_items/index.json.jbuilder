json.array!(@movie_items) do |movie_item|
  json.extract! movie_item, :id, :movie_id, :cart_id, :quantity
  json.url movie_item_url(movie_item, format: :json)
end
