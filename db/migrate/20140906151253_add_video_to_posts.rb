class AddVideoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :video, :text
  end
end
