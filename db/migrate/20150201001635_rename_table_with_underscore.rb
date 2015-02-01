class RenameTableWithUnderscore < ActiveRecord::Migration
  def change
    rename_table(:carads, :car_ads)
  end
end
