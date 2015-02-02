class AddCitiesDb < ActiveRecord::Migration
  def change
    create_table(:cities) do |t|
      t.column(:name, :string)
      t.column(:url_name, :string)
      t.timestamps
    end
  end
end
