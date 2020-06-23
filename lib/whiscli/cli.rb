class WHISCLI::CLI
  attr_accessor :category, :links, :selection
  @category = ["Japanese Whisky", "Bourbon Whiskey", "Single Malt Scotch"]
  @links = ["https://www.liquorama.net/spirits/japanese-whisky/", "https://www.liquorama.net/bourbon-whiskey/", "https://www.liquorama.net/single-malt-scotch-whisky/"]
  @selection = nil 
  def call 
   welcome 
   list_categories
   category_menu
   whisky_menu
  end

  def welcome
   puts "Welcome to Whiscli! Please select the type of whisk(e)y you would like to learn about or type list to see your wish list:" 
  end

  def list_categories
    puts "1. #{@categories[0]}"
    puts "2. #{@categories[1]}"
    puts "3. #{@categories[2]}"
  end
  
  def category_menu
    input = nil
    input = gets.strip.downcase
    while input != "exit"
    puts "Welcome to Whiscli! Please select the type of whisk(e)y you would like to learn about:"
    case input
    when "1"
      @selection = @category[0].index
      puts "More info on #{@category[0]}"
    when "2"
      @selection = @category[1].index
      puts "More info on #{@category[1]}"
    when "3"
      @selection = @category[2].index
      puts "More info on #{@category[2]}"
    when "list"
      Whisky.wishlist
    end
  end
  def whisky_menu
    Scraper.new.find_whisky(@links[@selection])
    
  end




end    