class RemoveMmfTokenFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :mmf_token, :text
  end
end
