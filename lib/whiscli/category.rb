class Category
#category has many whiskies

  attr_accessor :name, :link
  @@all = []

  def initialize(name, link)
    @name = name 
    @link = link 
    @@all << self
  end
  def self.whiskies
    Whisky.all.map {|item|item.category == self}
  end
  def self.all
    @@all 
  end

end


#scotch = Category.new('Scotch Whisky', liquorama.net/spirits/single-malt-scotch-whisky)

#Category.all[0].name = 'Scotch Whisky'