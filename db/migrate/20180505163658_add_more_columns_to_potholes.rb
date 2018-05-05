class AddMoreColumnsToPotholes < ActiveRecord::Migration[5.1]
  def change
    add_column :potholes, :depth, :integer
    add_column :potholes, :width, :integer
    add_column :potholes, :authorites_contacted, :boolean
  end
end
