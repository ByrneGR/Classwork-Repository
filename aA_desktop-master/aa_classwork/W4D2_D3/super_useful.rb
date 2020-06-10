# # PHASE 2
# def convert_to_int(str)
#   begin
#     Integer(str)
#   rescue ArgumentError => e
#     puts "Cannot convert to integer"
#     puts "Error was : #{e.message}"
#   end
# end

# # p convert_to_int("hello")

# class CoffeeFound < StandardError
# end

# # PHASE 3
# FRUITS = ["apple", "banana", "orange"]

# def reaction(maybe_fruit)
#   if FRUITS.include? maybe_fruit
#     puts "OMG, thanks so much for the #{maybe_fruit}!"
#   elsif maybe_fruit == "coffee"
#     raise CoffeeFound
#   else
#     raise StandardError
#   end
# end

# # p reaction("mango")

# def feed_me_a_fruit
#     puts "Hello, I am a friendly monster. :)"
#   begin
#     puts "Feed me a fruit! (Enter the name of a fruit:)"
#     maybe_fruit = gets.chomp
#     reaction(maybe_fruit)
#   rescue CoffeeFound => e
#     puts e.message
#   retry
#   end
# end

# p feed_me_a_fruit



# PHASE 4

class NotBestyError < StandardError
end

class NotEnoughError < StandardError
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      if name.length <= 0 || fav_pastime.length <= 0
        raise NotEnoughError
      end
      @name = name
      raise NotBestyError unless yrs_known >= 5
      @yrs_known = yrs_known
      @fav_pastime = fav_pastime
    rescue NotBestyError
      puts "Years known must be greater than or equal to 5"
    rescue NotEnoughError
      puts "Name and favorite past time should be passed in!"
    end

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

a=BestFriend.new("blah", 5, "")

