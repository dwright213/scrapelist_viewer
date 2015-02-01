class CarAd < ActiveRecord::Base

require 'open-uri'

  define_singleton_method(:scrape) do

    (1..3).each do |i|
      doc = Nokogiri::HTML(open("http://portland.craigslist.org/search/cto?s=#{i}00&"))
      content = doc.xpath("//div[contains(@class,'content')]")
      posts = content.xpath("//span[contains(@class,'txt')]")

      posts.each() do |post|
        if post.xpath("span").inner_text.index(/\$\d+/) != nil
          price = post.xpath("span").inner_text.slice!(/\$\d+/).slice!(/\d+/).to_i()

          if price > 100
            post_id = post.xpath("span/a/@data-id").text
            description = post.xpath("span/a").inner_text
            date = post.xpath("span/time/@datetime").text
            city = post.xpath("span").inner_text.slice!(/\([a-zA-Z]+\)/)

            CarAd.create(:price => price, :city => city, :description => description, :date => date)
          end
        end
      end
    end


  end

end
