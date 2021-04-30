class CreateOrderCards < ActiveRecord::Migration[6.1]
  def change
    create_table :order_cards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.date :day
      t.timestamps
    end
  end
end
