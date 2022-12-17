class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.unsigned_integer :id, primary_key: true, auto_increment: true, null: false
      t.string :access_token, null: false, unique: true
      t.string :name, null: false

      t.timestamps
    end
    add_index :users, :access_token, unique: true
  end
end
