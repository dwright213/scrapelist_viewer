class RenameTable < ActiveRecord::Migration
  def change
    rename_table(:cl_dirty, :carads)
  end
end
