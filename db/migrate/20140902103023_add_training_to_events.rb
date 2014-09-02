class AddTrainingToEvents < ActiveRecord::Migration
  def change
    add_column :events, :training, :integer
  end
end
