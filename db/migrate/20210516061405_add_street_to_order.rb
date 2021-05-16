class AddStreetToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :street, :string
  end
end
