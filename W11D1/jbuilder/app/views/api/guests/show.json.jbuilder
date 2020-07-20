json.extract! @guest, :name, :age, :favorite_color

json.gifts do 
  # @guests.each do |guest|
    gifts = @guest.gifts
    gifts.each do |gift|
      json.extract! gift, :title, :description
    end
end