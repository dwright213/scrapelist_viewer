class City < ActiveRecord::Base
  has_many :car_ads
  validates :url_name, uniqueness: {case_sensitive: false}

    # define_singleton_method(:populate) do |cities|
    #       City.create(:name => "Portland", :url_name => "portland")
    #       City.create(:name => "San Francisco", :url_name => "sfbay")
    # end
end
