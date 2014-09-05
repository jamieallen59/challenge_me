class AddSecretToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :secret, :text
  end
end
