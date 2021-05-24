class CreateLdapConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :ldap_configs do |t|
      t.string :host
      t.integer :port
      t.string :base
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
