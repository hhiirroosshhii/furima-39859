class CreateInformation < ActiveRecord::Migration[7.0]
  def change
    create_table :information do |t|
      t.string :postal, null: false
      t.integer :prefecture, null: false, foreign_key: true
      t.string :city, null: false
      t.string :house, null: false
      t.string :building
      t.string :donation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
