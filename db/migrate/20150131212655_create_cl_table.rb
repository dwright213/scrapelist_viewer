class CreateClTable < ActiveRecord::Migration
  def change
    create_table(:cl_dirty) do |t|
      t.column(:date, :date)
      t.column(:price, :int)
      t.column(:description, :string)
      t.column(:city, :string)

      t.timestamps
    end
  end
end
