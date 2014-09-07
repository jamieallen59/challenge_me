class AddCreatorToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :creator, :text
  end
end
