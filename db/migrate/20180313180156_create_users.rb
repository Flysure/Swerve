class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :born_on
      t.string :username
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
