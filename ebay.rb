require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'active_record'
require './lib/ear_ad'
require 'pg'
require 'pry'

ActiveRecord::Base.establish_connection(
adapter:  'postgresql', # or 'postgresql' or 'sqlite3'
database: 'scrape'
)

@display = 0

(1..2).each do |page, zip, distance|
  zip = 97209
  distance = 15
  @display = @display + 200
  doc = Nokogiri::HTML(open("http://www.ebay.com/sch/Cars-Trucks-/6001/i.html?LH_Distance=#{zip}..#{@display}&_from=R40&_nkw=&LH_Sold=1&_udlo=&_udhi=&LH_ItemCondition=4&_samilow=&_samihi=&_sadis=#{distance}&_stpos=#{zip}&_sop=12&_dmd=1&LH_Complete=1&_pgn=#{page}&_skc=#{@display}&rt=nc"))
  content = doc.xpath("//li[contains(@class, 'sresult lvresult clearfix li')]")

  content.each do |post|
    description = post.xpath("h3/a")
    description.css("a").each do |response_node|
      description = response_node["title"]
    end
    description = description.gsub(/Click this link to access\s/, "")
    price = post.xpath("ul/li/span[contains(@class, 'bold bidsold')]").inner_text
    #price = price.match(/\$\d+.\d{3}/)
    price = price.to_s.gsub(/\$|\,|\.\d{2}/, "")
    bids = post.xpath("ul/li[contains(@class, 'lvformat')]/span").inner_text
    ear_ad = EarAd.create({:description => description, :price => price, :bids => bids})
  end
end
