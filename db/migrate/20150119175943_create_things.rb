class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.integer :rating
      t.integer :num_ratings
      t.string :name

      t.timestamps null: false
    end
  end
end
