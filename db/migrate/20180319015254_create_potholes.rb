class CreatePotholes < ActiveRecord::Migration[5.1]
  def change
    create_table :potholes do |t|
      t.float :latitude
      t.float :longitude
      t.integer :severity
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :potholes, [:user_id, :created_at]
  end
end
