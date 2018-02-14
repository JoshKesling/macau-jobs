class CreatePreviousEmployments < ActiveRecord::Migration[5.1]
  def change
    create_table :previous_employments do |t|
      t.string :employer_name
      t.text :job_duties
      t.integer :months
      t.integer :years
      t.integer :ended_year
      t.string :location
      t.belongs_to :user, foreign_key: true
      t.belongs_to :cv, foreign_key: true

      t.timestamps
    end
  end
end
