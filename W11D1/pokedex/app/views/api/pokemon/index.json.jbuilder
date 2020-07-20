@pokemon.each do |poke|
  json.set! poke.id do # explicitly sets the key to the pokemon's id
    json.extract! poke, :id, :name
    json.image_url asset_path("pokemon_snaps/#{poke.image_url}") #sets image url
  end
end