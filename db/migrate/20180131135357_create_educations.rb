class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.references :user, foreign_key: true
      t.references :cv, foreign_key: true
      t.string :name
      t.string :city
      t.string :country
      t.integer :years_attended
      t.integer :year_completed
      t.integer :months_attended
      t.boolean :graduated

      t.timestamps
    end
  end
end
