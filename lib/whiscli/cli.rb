class Whiscli::CLI
  attr_accessor :links, :selection, :categories
#  attr_reader :categories
  @categories = ["Japanese Whisky", "Bourbon Whiskey", "Single Malt Scotch"]
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
  end
  def whisky_menu
    Scraper.new.find_whisky(@links[@selection])
    Whisky.all.each_with_index do |whisky, i|
      puts "#{i}. #{whisky.name}"
    end
    input = gets.strip.downcase
    while input != "exit"
      Whisky.all.each do |whisky|
        if whisky.index == input.to_i
          puts "#{whisky.name}, #{whisky.price}, a fine #{whisky.category}"
          puts "To add to your wishlist, type 'add'. To return to the main menu, type 'menu'."
          input = gets.strip
            if input == "menu"
              category_menu
            elsif input == "add"
              whisky.add_wishlist
            else 
              puts "We only work with a select variety of spirits. Please type either 'add', 'menu', or 'exit'."
            end
          end
      end
    end
  end
end    