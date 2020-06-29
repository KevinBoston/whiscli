class Whiscli::Whisky

  attr_accessor :name, :price, :link, :category, :description
  @@all = []
  def initialize
    @name = name
    @@all << self
    #self.category = Whiscli::Cli.categories[Whiscli::Cli.selection]
  end
  def self.all 
    @@all 
  end

end