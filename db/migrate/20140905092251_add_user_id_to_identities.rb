class AddUserIdToIdentities < ActiveRecord::Migration
  def change
    add_reference :identities, :user, index: true
  end
end
