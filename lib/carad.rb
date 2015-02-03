class CarAd < ActiveRecord::Base
belongs_to :city
require 'open-uri'

  define_singleton_method(:scrape) do
    rightnow = Time.new
    cities = City.all
    #cycle through the first however many pages of craigslist, breaking out of this loop if we find that our ads are old or redundant.
    cities.each do |url_city|
      olderads = false
      (0..100).each do |i|
        if(i==0)
          doc = Nokogiri::HTML(open("http://#{url_city.url_name}.craigslist.org/search/cto"))
        else
          doc = Nokogiri::HTML(open("http://#{url_city.url_name}.craigslist.org/search/cto?s=#{i}00&"))
        end
        content = doc.xpath("//div[contains(@class,'content')]")
        posts = content.xpath("//span[contains(@class,'txt')]")

        #parse out each individual post
        posts.each() do |post|
          if post.xpath("span").inner_text.index(/\$\d+/) != nil
            post_date = Time.parse(post.xpath("span/time/@datetime").text)
            clid = post.xpath("span/a/@data-id").text

            #breakout of the main paging loop if we find that our postings are either older than 24 hours or already in the db, by craigslist id.
            if (rightnow - post_date) > 3600
              olderads = true
              break
            # elsif CarAd.find(:clid => clid).count >= 1
            #   olderads = true
            #   break
            end

            price = post.xpath("span").inner_text.slice!(/\$\d+/).slice!(/\d+/).to_i()
            if price > 100 && price < 3000000
              description = post.xpath("span/a").inner_text
              # city = post.xpath("span").inner_text.slice!(/\([a-zA-Z]+\)/) OLD
              CarAd.create(:price => price, :city_id => url_city.id, :description => description, :date => post_date, :clid => clid)
            end
          end
        end
        if olderads == true
          break
        end
    end
  end
  end
end
