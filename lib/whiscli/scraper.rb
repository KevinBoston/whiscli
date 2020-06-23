class Scraper
  require 'open-uri'

 # def find_categories
    # #faceted-search-container > div > ul > li.active-category.collapsable > ul
    #navigate to spirits menu
    #compare headings to ensure they contain 'whisk'
    #store matches in array
    #scrape match array to make category objects

    doc
  #end

  def self.scrape_whisky
    #doc = Nokogiri::HTML.open(url) 
    new_whisky = Whisky.new
    new_whisky.name = name
    new_whisky.price = price
    new_whisky.url = 
    #etc
    new_whisky
  end
  def find_whisky(url)
    doc = Nokogiri::HTML.open(url)
    container = nokogiri... blah blah 
    contailer.each do |whisky_frame|
      whisky_frame.scrape_whisky
    end
  end
    #doc.map do |html|
       #if html.tag.contain("whisk")
         #self.scrape_whisky
       #end
    #end

end