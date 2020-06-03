require 'singleton'
class NullPiece
  include Singleton
  
  def initialize
  end
  
  # Overwrites what we see when printing NullPieces
  def inspect
    :N
  end    
end    