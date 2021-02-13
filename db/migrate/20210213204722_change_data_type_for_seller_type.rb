class ChangeDataTypeForSellerType < ActiveRecord::Migration[6.0]
  def up
    change_table :listings do |t|
      t.change :seller_type, :string
    end
  end

  def down
    change_table :listings do |t|
      t.change :seller_type, :text
    end
  end
end
