class ChangeColumnNameBack < ActiveRecord::Migration[5.1]
  def change
    rename_column :potholes, :address, :loc
  end
end
