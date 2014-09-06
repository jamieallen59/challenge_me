class CreateTrainingsessions < ActiveRecord::Migration
  def change
    create_table :trainingsessions do |t|
      t.text :details
      t.belongs_to :event, index: true
     
      t.timestamps
    end
  end
end
