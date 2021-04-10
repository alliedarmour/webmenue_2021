class AddProviderToIdentities < ActiveRecord::Migration[6.1]
  def change
    add_column :identities, :provider, :string
  end
end
