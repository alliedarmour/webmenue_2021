class AddIndexToIdentities < ActiveRecord::Migration[6.1]
  def change
    add_index :identities, :username, unique: true
  end
end
