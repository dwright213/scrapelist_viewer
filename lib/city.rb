class City < ActiveRecord::Base
  has_many :car_ads
  validates :url_name, uniqueness: {case_sensitive: false}


  def average_price
    number_of_ads = self.car_ads.count
    total = 0
    car_ads.each do |car_ad|
      total += car_ad.price
    end
    if number_of_ads == 0
      city_ave = 0
    else
      city_ave = total/number_of_ads
    end
  end

  def self.generate_tsv
    tsv = File.new("./public/test.tsv", "w+")
    output = ""

    output.concat("date\t")

    City.all.each do |city|
      output.concat("#{city.name}\t")
    end

    output.concat("\n")

    feb_03 = Time.at(1423009900)

    days_of_data = []

    days_of_data.push(feb_03)

    until (feb_03.to_s[0...10] == Time.now.to_s[0...10]) do
      feb_03 += 86400
      days_of_data.push(feb_03)
    end

    days_of_data.each do |day|
      output.concat("#{day.to_s[0...10].gsub("-", "")}\t")
        City.all.each() do |city|
          output.concat("#{city.average_price_for_day(day.to_s[0...10])}\t")
        end
      output.concat("\n")
    end
    IO.write(tsv, output)
  end

  def average_price_for_day(date)
    sum = 0
    count = self.car_ads.count
    self.car_ads.each do |ad|
      if ad.date[0...10].eql?(date)
        sum += ad.price
      end
    end
    sum /= count
  end
end
