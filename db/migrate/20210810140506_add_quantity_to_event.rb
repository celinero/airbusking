class AddQuantityToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :quantity, :integer
  end
end
