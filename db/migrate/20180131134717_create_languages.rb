class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.references :user, foreign_key: true
      t.references :cv, foreign_key: true
      t.string :name
      t.string :read
      t.string :write
      t.string :speak
      t.string :listen

      t.timestamps
    end
  end
end
