class CreateAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone

      t.timestamps
    end
  end
end
