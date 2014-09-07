class AddSessiondateToTrainingsession < ActiveRecord::Migration
  def change
    add_column :trainingsessions, :sessiondate, :date
  end
end
