class FixLocationName < ActiveRecord::Migration[5.1]
  def change
    rename_column :potholes, :location, :loc
  end
end
