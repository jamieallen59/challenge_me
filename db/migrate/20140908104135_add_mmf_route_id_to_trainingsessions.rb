class AddMmfRouteIdToTrainingsessions < ActiveRecord::Migration
  def change
    add_column :trainingsessions, :mmf_route_id, :string
  end
end
