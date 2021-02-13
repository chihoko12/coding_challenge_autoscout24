class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :listing, null: false, foreign_key: true
      t.integer :contact_date

      t.timestamps
    end
  end
end
