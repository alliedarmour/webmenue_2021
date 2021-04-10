class CreateIdentities < ActiveRecord::Migration[6.1]
  def change
    create_table :identities do |t|
      t.string :username, unique: true
      t.string :password_digest
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
