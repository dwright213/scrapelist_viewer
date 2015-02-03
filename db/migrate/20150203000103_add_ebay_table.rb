class AddEbayTable < ActiveRecord::Migration
  def change
    create_table(:ear_ads) do |t|
      t.column(:price, :integer)
      t.column(:description, :string)
      t.column(:bids, :string)

      t.timestamps
    end
  end
end
