class Whiscli::Scraper
  require 'open-uri'

 
  def initialize
    
  end
   
  def scrape_whisky(whisky_obj)
    page = Nokogiri::HTML(open(whisky_obj.link))
    #binding.pry
    #whisky_obj.price = page.css('.price').text.strip
    whisky_obj.description = page.css('.tab-content p').text
    whisky_obj
  end
  def find_whisky(url, selection)
    doc = Nokogiri::HTML(open(url))
    frames = doc.css('.card-title a')
    bottom = doc.css('.card-text span.price').text.split.uniq!
    #binding.pry
    frames.map do |whisky_frame|
      new_whisk = Whiscli::Whisky.new
      new_whisk.name = whisky_frame.text
      new_whisk.link = whisky_frame['href']
      new_whisk.category = selection
      new_whisk.price = bottom[1]
      new_whisk
    end
  end
  # def find_categories
    # #faceted-search-container > div > ul > li.active-category.collapsable > ul
    #navigate to spirits menu
    #compare headings to ensure they contain 'whisk'
    #store matches in array
    #scrape match array to make category objects

   # doc
  #end
end