class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :body
      t.boolean :open
      t.datetime :closed_date

      t.timestamps
    end
  end
end
