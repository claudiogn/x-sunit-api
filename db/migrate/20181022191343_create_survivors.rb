class CreateSurvivors < ActiveRecord::Migration[5.1]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.decimal :latitude
      t.decimal :longitude
      t.integer :flags, default: 0
      t.boolean :abducted, default: false

      t.timestamps
    end
  end
end
