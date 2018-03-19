class AddLocationColumnToPotholes < ActiveRecord::Migration[5.1]
  def change
    add_column :potholes, :location, :string
  end
end
