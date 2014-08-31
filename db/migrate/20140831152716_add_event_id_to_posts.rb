class AddEventIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :event, index: true
  end
end
