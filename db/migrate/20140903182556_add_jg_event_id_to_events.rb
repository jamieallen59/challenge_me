class AddJgEventIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :jg_event_id, :integer
  end
end
