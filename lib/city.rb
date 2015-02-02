class City < ActiveRecord::Base

    def self.populate
      City.create(:name => "Portland", :url_name => "portland")
      City.create(:name => "San Francisco", :url_name => "sfbay")
  end
end
