class Scraper

  def find_categories
    # #faceted-search-container > div > ul > li.active-category.collapsable > ul
    #navigate to spirits menu
    #compare headings to ensure they contain 'whisk'
    #store matches in array
    #scrape match array to make category objects

    doc
  end



  def scrape_category
    doc = nokogiri ..... ==> 
    new_cat = Category.new
    new_cat.name = doc.(...)
    new_cat.link = doc.()
    new_cat

  end

  def scrape_whisky
    doc = nokogiri .... ==>
    new_whisky = Whisky.new
    new_whisky.name = name
    new_whisky.price = price
    #etc
    new_whisky
  end
  def find_whisky
    doc = nokogiri... 
    doc.map do |html|
       if html.tag.contain("whisk")
         self.scrape_whisky
       end
    end
  end






end