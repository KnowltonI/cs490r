class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :contents
      t.integer :event_id

      t.timestamps
    end
  end
end
