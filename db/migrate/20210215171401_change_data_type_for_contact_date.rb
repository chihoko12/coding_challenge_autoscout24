class ChangeDataTypeForContactDate < ActiveRecord::Migration[6.0]
  def up
    change_table :contacts do |t|
      t.change :contact_date, :string
    end
  end

  def down
    change_table :contacts do |t|
      t.change :contact_date, :integer
    end
  end
end
