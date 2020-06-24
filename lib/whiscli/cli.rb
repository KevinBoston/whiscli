class Whiscli::Cli
  attr_accessor :links, :selection, :categories
#  attr_reader :categories
  LINKS = ["/spirits/japanese-whisky/", "/bourbon-whiskey/", "/single-malt-scotch-whisky/"]
  BASEURL = "https://liquorama.net"
  def initialize
    @categories = ["Japanese Whisky", "Bourbon Whiskey", "Single Malt Scotch Whisky"]
    #@links = ["/spirits/japanese-whisky/", "/bourbon-whiskey/", "/single-malt-scotch-whisky/"]
    @selection = nil 
    #@baseurl = "https://liquorama.net"
  end
  def call 
   welcome 
   list_categories
   category_menu
   whisky_menu
  end

  def welcome
   puts "Welcome to Whiscli! Please select the type of whisk(e)y you would like to learn about or type list to see your wish list:" 
  end
 def self.links
   LINKS 
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
   # puts "Welcome to Whiscli! Please select the type of whisk(e)y you would like to learn about:"
    case input
    when "1"
      @selection = input.to_i
      puts "More info on #{@categories[0]}"
      whisky_menu
    when "2"
      @selection = input.to_i
      puts "More info on #{@categories[1]}"
      whisky_menu
    when "3"
      @selection = input.to_i
      puts "More info on #{@categories[2]}"
      whisky_menu
    when "list"
      Whisky.wishlist
    end
  end
  end
  def whisky_menu
    scrape = Whiscli::Scraper.new.find_whisky("#{BASEURL}#{LINKS[@selection-1]}") #instantiates Scraper, calls find_whisky, and passes baseurl + the selection's index
    #scraper should create whisky objects, which are added to whisky.all
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