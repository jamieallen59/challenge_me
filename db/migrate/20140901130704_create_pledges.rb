class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.string :title
      t.integer :amount
      t.text :info

      t.timestamps
    end
  end
end
