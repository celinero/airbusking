class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.date :date
      t.time :time
      t.integer :price
      t.boolean :sold, null:false, default: false

      t.timestamps
    end
  end
end
