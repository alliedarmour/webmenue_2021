class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.text :description
      t.string :tip
      t.date :day
      t.timestamps
    end
  end
end
