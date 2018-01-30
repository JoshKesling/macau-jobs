class AddSummaryToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :summary, :text
  end
end
