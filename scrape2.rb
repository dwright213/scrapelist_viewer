require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'active_record'
require 'pg'
require './lib/carad'

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql', # or 'postgresql' or 'sqlite3'
  database: 'scrape'
)


@items = Array.new
$i = 0
(1..2).each do |i|
  doc = Nokogiri::HTML(open("http://portland.craigslist.org/search/cto?s=#{i}00&"))
  @items.push(doc.xpath("//div/p").collect {|node| node.text.strip})
end
  # prices = doc.xpath("//div[contains(@class,'product')]/p[not(@style)]/text()").collect {|node| node.text.strip}
  # prices.delete("")

@items.each do |page|
  (1..100).each do
    line = page.pop
    price = line.match(/\$\d+/)
    price = price.to_s.gsub(/\$/, "")
    line = line.gsub(/\$\d+/, "")
    date = line.match(/[A-Z][a-z][a-z]\s\d\d?/)
    line = line.gsub(/[A-Z][a-z][a-z]\s\d\d?/, "")
    city = line.match(/\(.*\)/)
    line = line.gsub(/\(.*\)/, "")
    line = line.gsub(/(pic|map)/, "")
    description = line
    CarAd.create(:price => price, :city => city, :description => description, :date => date)

  end
  puts "======================================"
end
