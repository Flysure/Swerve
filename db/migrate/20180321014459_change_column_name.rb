class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :potholes, :location, :address
  end
end
