class AddCityIdColumnToCarAds < ActiveRecord::Migration
  def change
    remove_column :car_ads, :city
    add_column :car_ads, :city_id, :integer
  end
end
