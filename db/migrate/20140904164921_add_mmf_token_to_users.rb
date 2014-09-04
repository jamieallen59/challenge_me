class AddMmfTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mmf_token, :text
  end
end
