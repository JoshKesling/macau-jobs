class CreateJoinTableJobsUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :jobs, :users do |t|
      t.references :job, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
