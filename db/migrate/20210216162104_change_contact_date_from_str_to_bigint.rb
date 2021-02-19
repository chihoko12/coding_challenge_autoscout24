class ChangeContactDateFromStrToBigint < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE contacts
      ALTER COLUMN contact_date TYPE bigint USING contact_date::bigint
    SQL
  end

  def down
    change_table :contacts do |t|
      t.change :contact_date, :string
    end
  end
end
