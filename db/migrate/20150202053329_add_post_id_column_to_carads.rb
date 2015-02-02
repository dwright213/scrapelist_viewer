class AddPostIdColumnToCarads < ActiveRecord::Migration
  def change
    add_column(:car_ads, :post_id, :string)
  end
end
