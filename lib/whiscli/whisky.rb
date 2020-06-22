class Whisky

  attr_accessor :name, :age, :price, :link, :alcohol_content, :category
  @@all = []
  @@list = []
  def initialize(name)
    @name = name
    @@all << self
  end
    

  def self.add_wishlist
    @@list << self
  end
  def self.wishlist
    @@list 
  end