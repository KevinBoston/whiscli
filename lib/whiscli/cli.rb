class Whiscli::Cli
  attr_accessor :links, :selection, :categories
#  attr_reader :categories
  LINKS = ["/spirits/japanese-whisky/", "/bourbon-whiskey/", "/single-malt-scotch-whisky/", "/irish-whiskey/"]
  BASEURL = "https://liquorama.net"
  def initialize
    @categories = ["Japanese Whisky", "Bourbon Whiskey", "Single Malt Scotch Whisky", "Irish Whiskey"]
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
    puts "4. #{@categories[3]}"
  end
  
  def category_menu
    input = nil
    input = gets.strip.downcase
    if input == "exit"
      exit 
    end
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
      when "4"
      @selection = input.to_i
      puts "More info on #{@categories[3]}"
      whisky_menu
    when "list"
      Whiscli::Whisky.wishlist
      call
    end
    exit
  end
  end
  def whisky_menu
    Whiscli::Whisky.wipe
    Whiscli::Scraper.new.find_whisky("#{BASEURL}#{LINKS[@selection-1]}", @categories[@selection-1]) #instantiates Scraper, calls find_whisky, and passes baseurl + the selection's index
    #scraper should create whisky objects, which are added to whisky.all
    #binding.pry
    puts "Please select a variety of #{@categories[@selection.to_i - 1]} by typing its number:"
    Whiscli::Whisky.all.each_with_index do |whisky, i|
      puts "#{i + 1}. #{whisky.name}"
    end
    #binding.pry
      input = gets.strip.downcase
      if input == "exit"
        exit 
      end
      selected_whisky = Whiscli::Whisky.all[input.to_i - 1]
      Whiscli::Scraper.new.scrape_whisky(selected_whisky)
    if input != "exit" || input != "list" || input != "add"
      puts "#{selected_whisky.name}, #{selected_whisky.price}, a fine #{selected_whisky.category}"
      puts selected_whisky.description
      puts "To add to your wishlist, type 'add'. To return to the main menu, type 'menu'."
        input = gets.strip
        if input == "exit"
          exit 
        elsif input == "menu"
          call
        elsif input == "add"
            selected_whisky.add_wishlist
            call
        else 
          puts "We only work with a select variety of spirits. Please type either 'add', 'menu', or 'exit'."
        end
      end
    end
  end