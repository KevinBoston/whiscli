class Whiscli::Whisky

  attr_accessor :name, :price, :link, :alcohol_content, :category, :description
  @@all = []
  @@list = []
  def initialize
    @name = name
    @@all << self
    self.category = Cli.categories[Cli.selection]
  end
  def self.all 
    @@all 
  end
    

  def self.add_wishlist
    @@list << self
  end
  def self.wishlist
    @@list 
  end
end