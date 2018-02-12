class RemoveCurrentAddressFromCvs < ActiveRecord::Migration[5.1]
  def change
    remove_column :cvs, :current_address_L1, :string
    remove_column :cvs, :current_address_L2, :string
  end
end
