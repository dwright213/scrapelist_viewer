require 'spec_helper'

describe City do
  describe '#average_price' do
    it 'averages the prices of all ads in the city' do
      test_city = City.create( name: 'Chicago' )
      test_car_ad = CarAd.create(description: 'football', price: 34, city_id: test_city.id)
      test_car_ad2 = CarAd.create(description: 'basketball', price: 26, city_id: test_city.id)
      expect(test_city.average_price).to eq(30)
    end
  end
end
