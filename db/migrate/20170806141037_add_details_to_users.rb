class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string
    add_column :users, :books_quantity, :integer, default: 0
  end
end
