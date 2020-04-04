class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :stock
      t.text :desc
      t.integer :price
      t.string :image
      t.timestamps
    end
  end
end
