class RemoveUserIdFromNestedModels < ActiveRecord::Migration[5.1]
  def change
    remove_column :languages, :user_id
    remove_column :previous_employments, :user_id
    remove_column :educations, :user_id
  end
end
