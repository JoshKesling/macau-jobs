class AddColumnsToCvs < ActiveRecord::Migration[5.1]
  def change
    add_column :cvs, :passport_country, :string
    add_column :cvs, :passport_number, :string
    add_column :cvs, :passport_expiration_date, :date
  end
end
