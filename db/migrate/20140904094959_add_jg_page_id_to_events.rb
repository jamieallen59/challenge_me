class AddJgPageIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :jg_page_id, :integer
  end
end
