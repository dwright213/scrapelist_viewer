ENV['RACK_ENV'] = 'test'
require("bundler/setup")
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each {|file| require file}

RSpec.configure do |config|
  config.after(:each) do
    CarAd.all().each() do |car_ad|
      car_ad.destroy()
    end
    City.all.each do |city|
      city.destroy
    end
  end
end
