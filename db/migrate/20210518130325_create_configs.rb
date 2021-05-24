class CreateConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :configs do |t|
      t.references :configurable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
