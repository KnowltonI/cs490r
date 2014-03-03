class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :notes
      t.date :due_date
      t.time :due_time
      t.integer :priority

      t.timestamps
    end
  end
end
