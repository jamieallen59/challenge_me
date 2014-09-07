class AddAmountToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :amount, :integer
  end
end
