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
   
  def self.scrape_whisky(whisky_obj)
  page = Nokogiri::HTML(open(whisky_obj.link))
  whisky_obj.price = page.css('.price').text.strip
  whisky_obj.description = page.css('.tab-content p').text
  whisky_obj
end
  def find_whisky(url, selection)
    #doc = Nokogiri::HTML(open(url))
    #add baseurl and pull index via selector
    doc = Nokogiri::HTML(open(url))
    frames = doc.css('.card-title a')
    #binding.pry
    frames.each do |whisky_frame|
      new_whisk = Whiscli::Whisky.new
      new_whisk.name = whisky_frame.text
      new_whisk.link = whisky_frame['href']
      new_whisk.category = selection
    end
  end
end