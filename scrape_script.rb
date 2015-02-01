  #  require 'carad'
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'

    @items = Array.new
    $i = 0
    $num = 3
    (1..20).each do |i|
      doc = Nokogiri::HTML(open("http://portland.craigslist.org/search/cto?s=#{i}00&"))
      @items.push(doc.xpath("//div/p").collect {|node| node.text.strip})
    end
      # prices = doc.xpath("//div[contains(@class,'product')]/p[not(@style)]/text()").collect {|node| node.text.strip}
      # prices.delete("")

    @items.each do |page|
      (1..100).each do
        line = page.pop
        puts line
        price = line.match(/\$\d+/)
        line = line.gsub(/\$\d+/, "")
        date = line.match(/[A-Z][a-z][a-z]\s\d\d?/)
        line = line.gsub(/[A-Z][a-z][a-z]\s\d\d?/, "")
        city = line.match(/\(.*\)/)
        line = line.gsub(/\(.*\)/, "")
        line = line.gsub(/(pic|map)/, "")
        description = line
      #  CarAd.create(:price => price, :date => date, :city => city, :description => description)

      end
      puts "======================================"
    end
