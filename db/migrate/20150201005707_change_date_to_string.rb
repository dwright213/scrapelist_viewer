class ChangeDateToString < ActiveRecord::Migration
  def change
    remove_column(:car_ads, :date)
    add_column(:car_ads, :date, :string)
  end
end
