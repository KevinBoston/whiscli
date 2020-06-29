class Whiscli::Cli
  attr_accessor :selection, :categories, :selected_whisky, :selected_arr
  LINKS = ["/spirits/japanese-whisky/", "/bourbon-whiskey/", "/single-malt-scotch-whisky/", "/irish-whiskey/"]
  BASEURL = "https://liquorama.net"
  SECRET = "We do not have any secret whiskies. Please choose from the options listed or type exit."
  @@list = []
  def initialize
    @categories = ["Japanese Whisky", "Bourbon Whiskey", "Single Malt Scotch Whisky", "Irish Whiskey"]
    @selection = nil
  end
  def call 
   welcome 
   list_categories
   category_menu
   whisky_menu
  end
  
  def whisky_menu
    display_whisky
    print_whisky_info
    add_wishlist
  end

  def welcome
   puts "Welcome to Whiscli! Please select the type of whisk(e)y you would like to learn about or type list to see your wish list:" 
  end

  def list_categories
    @categories.each_with_index {|cat, i| puts "#{i + 1}. #{cat}"}
  end
  
  
  def category_menu
    input = nil
    input = gets.strip.downcase
 
    if input == "exit"
      exit 
    elsif input == "list"
      wishlist 
      call 
    elsif input.to_i > 4 || input.to_i <= 0 
      puts SECRET 
      category_menu
    end
    while input != "exit"
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
        end
    end
  end
  
  def display_whisky
    @selected_arr = Whiscli::Scraper.new.find_whisky("#{BASEURL}#{LINKS[@selection-1]}", @categories[@selection-1]) 
    puts "Please select a variety of #{@categories[@selection.to_i - 1]} by typing its number:"
    selected_arr.each_with_index do |whisky, i|
      puts "#{i + 1}. #{whisky.name}"
    end
  end
  
  def print_whisky_info
    input = gets.strip.downcase
    if input.to_i <= @selected_arr.length
      if input == "exit"
        exit 
      end
      @selected_whisky = @selected_arr[input.to_i - 1]
      Whiscli::Scraper.new.scrape_whisky(selected_whisky)
      puts "#{selected_whisky.name}, #{selected_whisky.price}, a fine #{selected_whisky.category}"
      puts selected_whisky.description
      puts "To add to your wishlist, type 'add'. To return to the main menu, type 'menu'."
      add_wishlist
    else 
      puts SECRET
      print_whisky_info
    end
  end
    
  

  def add_wishlist
    input = gets.strip
      if input == "exit"
        exit 
      elsif input == "menu"
        call
      elsif input == "add"
        @@list << @selected_whisky
        puts "#{@selected_whisky.name} was added to your wishlist!"
        call
      else 
        puts "We only work with a select variety of spirits. Please type either 'add', 'menu', or 'exit'."
        print_whisky_info
      end
    end
  
  def wishlist
    @@list.uniq!
    puts "Your wishlist:"
    @@list.each do |whisky|
      puts "-#{whisky.name}"
    end
    puts "-----------------"
  end
end