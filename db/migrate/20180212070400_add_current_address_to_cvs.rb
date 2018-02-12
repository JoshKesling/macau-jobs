class AddCurrentAddressToCvs < ActiveRecord::Migration[5.1]
  def change
    add_column :cvs, :current_address, :string
  end
end
