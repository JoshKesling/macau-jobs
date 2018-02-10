class AddAgentToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :agent, foreign_key: true
  end
end
