class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :caption

      t.timestamps
    end
  end
end
