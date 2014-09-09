class AddUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :url, :text
  end
end
