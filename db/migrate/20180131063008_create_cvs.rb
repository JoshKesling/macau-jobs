class CreateCvs < ActiveRecord::Migration[5.1]
  def change
    create_table :cvs do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :marital_status
      t.integer :children
      t.string :phone_number
      t.string :current_address_L1
      t.string :current_address_L2
      t.string :current_city
      t.string :current_country
      t.text :skills
      t.boolean :work_visa
      t.date :visa_exp_date
      t.string :nationality

      t.timestamps
    end
  end
end
