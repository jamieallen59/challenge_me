class CreateIdentity < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :provider
      t.integer :uid
      t.text :token
    end
  end
end
