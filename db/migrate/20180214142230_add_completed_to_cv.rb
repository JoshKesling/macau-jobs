class AddCompletedToCv < ActiveRecord::Migration[5.1]
  def change
    add_column :cvs, :completed, :boolean
  end
end
