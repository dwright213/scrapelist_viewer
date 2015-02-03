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
    tsv = File.new("./test.tsv", "w+")
  end
end
