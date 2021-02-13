class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :make
      t.integer :price
      t.integer :mileage
      t.text :seller_type

      t.timestamps
    end
  end
end
