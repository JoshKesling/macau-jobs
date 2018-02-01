class RemoveNationalityFromCvs < ActiveRecord::Migration[5.1]
  def change
    remove_column :cvs, :nationality, :string
  end
end
