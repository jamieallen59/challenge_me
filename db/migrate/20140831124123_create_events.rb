class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :event_date
      t.string :charity
      t.integer :target
      t.float :amount_raised

      t.timestamps
    end
  end
end
