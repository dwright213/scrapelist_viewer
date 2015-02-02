class CarAd < ActiveRecord::Base

require 'open-uri'

  define_singleton_method(:scrape) do
    rightnow = Time.new
    olderads = false
    (1..20).each do |i|
      doc = Nokogiri::HTML(open("http://portland.craigslist.org/search/cto?s=#{i}00&"))
      content = doc.xpath("//div[contains(@class,'content')]")
      posts = content.xpath("//span[contains(@class,'txt')]")

      posts.each() do |post|
        if post.xpath("span").inner_text.index(/\$\d+/) != nil
          post_date = Time.parse(post.xpath("span/time/@datetime").text)

          if (rightnow - post_date) > 86400

            olderads = true
            break
          end

          price = post.xpath("span").inner_text.slice!(/\$\d+/).slice!(/\d+/).to_i()
          if price > 100
            post_id = post.xpath("span/a/@data-id").text
            description = post.xpath("span/a").inner_text
            city = post.xpath("span").inner_text.slice!(/\([a-zA-Z]+\)/)

            CarAd.create(:price => price, :city => city, :description => description, :date => post_date, :post_id => post_id)
          end
        end
      end

      if olderads == true
        break
      end

    end


  end

end
