class AddPledgeAmountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :amount, :integer
  end
end
