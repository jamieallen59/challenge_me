class AddEventIdToChallenges < ActiveRecord::Migration
  def change
    add_reference :challenges, :event, index: true
  end
end
