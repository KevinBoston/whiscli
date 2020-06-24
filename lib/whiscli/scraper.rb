class Whiscli::Scraper
  require 'open-uri'

 # def find_categories
    # #faceted-search-container > div > ul > li.active-category.collapsable > ul
    #navigate to spirits menu
    #compare headings to ensure they contain 'whisk'
    #store matches in array
    #scrape match array to make category objects

   # doc
  #end
  def initialize
    
  end
   name = "Glen - fake"
   price = "$100 - fake"
   description = "fake"
  def self.scrape_whisky
    #doc = Nokogiri::HTML.open(url) 
    new_whisky = Whisky.new
    new_whisky.name = name
    new_whisky.price = price
    new_whisky.link = 
    whisky_page = Nokogiri::HTML(open(new_whisky.link))
    price
    description
    #etc
    new_whisky
  end
  def find_whisky(url)
    #doc = Nokogiri::HTML(open(url))
    #add baseurl and pull index via selector
    doc = Nokogiri::HTML.parse(url)
    frames = doc.css('.card-figure')
    #nokogiri... blah blah
    frames.each do |whisky_frame|
    #container = Nokogiri::HTML 
    #container.each do |whisky_frame|
      whisky_frame.scrape_whisky
    end
  end
  
  #get title and url, display title to user 
  #let user select specific whisky
  #scrape specific whisky 
  
    #doc.map do |html|
       #if html.tag.contain("whisk")
         #self.scrape_whisky
       #end
    #end

end