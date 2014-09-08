class AddMmfUpdatedDateTimeToTrainingsessions < ActiveRecord::Migration
  def change
    add_column :trainingsessions, :mmf_updated_datetime, :string
  end
end
