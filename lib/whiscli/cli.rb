class WHISCLI::CLI

  def call 
   welcome 
   list_categories
   category_menu

  end

  def welcome
   puts “Welcome to Whiscli! Please select the type of whisk(e)y you would like to learn about or type list to see your wish list:” 
  end

  def list_categories
    Scraper.find_categories
    #uses scraped data to generate menu
      #scraper generates data, creates whisky objects, whisky objects are in whisky.all
    #uses .all array to 
    @categories = Category.all.each_with_index do |item, index|
      puts "#{index + 1}. #{item}"
    end
  end
  
  def category_menu
    input = nil
    input = gets.strip.downcase
    while input != "exit"
    puts "Welcome to Whiscli! Please select the type of whisk(e)y you would like to learn about:"
    case input
    when "1"
      puts "More info on #{Category.all[0]}"
    when "2"
      puts "More info on #{Category.all[1]}"
    when "3"
      puts "More info on #{Category.all[2]}"
    when "4"
      puts "More info on #{Category.all[3]}"
    when "5"
      puts "More info on #{Category.all[4]}"
    when "6"
      puts "More info on #{Category.all[5]}"
    end
  end




end    