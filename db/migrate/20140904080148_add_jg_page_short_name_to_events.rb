class AddJgPageShortNameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :jg_short_name, :string
  end
end
