class AddVisaCountryToCvs < ActiveRecord::Migration[5.1]
  def change
    add_column :cvs, :visa_country, :string
  end
end
