class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.string :name
      t.string :publisher
      t.integer :year

      t.timestamps
    end
  end
end
