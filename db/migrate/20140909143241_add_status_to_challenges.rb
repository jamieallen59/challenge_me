class AddStatusToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :status, :string
  end
end
