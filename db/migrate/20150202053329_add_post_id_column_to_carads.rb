class AddPostIdColumnToCarads < ActiveRecord::Migration
  def change
    add_column(:car_ads, :clid, :string)
  end
end
