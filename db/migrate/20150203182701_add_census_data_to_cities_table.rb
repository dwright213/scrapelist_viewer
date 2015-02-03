class AddCensusDataToCitiesTable < ActiveRecord::Migration
  def change
    add_column(:cities, :population, :string)
    add_column(:cities, :median_income, :string)
    add_column(:cities, :poverty, :string)

  end
end
