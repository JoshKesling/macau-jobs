class DropJobsUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :jobs_users
    drop_table :job_users
  end
end
