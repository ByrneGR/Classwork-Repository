json.pokemon do
#   json.set! @pokemon.id do
      json.extract! @pokemon, :id, :name, :defense, :moves, :poke_type, :item_ids
      json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
#   end
end  


json.items do 
  items = @pokemon.items    # items is an array
  # @guests.each do |guest|
    items.each do |item|
      json.set! item.id do
        json.extract! item, :id, :name, :pokemon_id, :price, :happiness
        json.image_url asset_path("#{item.image_url}")
      end  
    end
end



