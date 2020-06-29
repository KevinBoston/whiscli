class Whiscli::Whisky

  attr_accessor :name, :price, :link, :alcohol_content, :category, :description
  @@all = []
  @@list = []
  def initialize
    @name = name
    @@all << self
    #self.category = Whiscli::Cli.categories[Whiscli::Cli.selection]
  end
  def self.all 
    @@all 
  end
  
  def self.wipe 
    @@all.clear 
  end
    

  def add_wishlist
    @@list << self.name
    puts "#{self.name} was added to your wishlist!"
  end
  def self.wishlist
    @@list.uniq!
    puts "Your wishlist:"
    @@list.each do |whisky|
      puts "-#{whisky}"
    end
    puts "-----------------"
  end
end