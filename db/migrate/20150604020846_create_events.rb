class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.timestamp :start
      t.timestamp :end
      t.string :address, default: []
      t.text :comment
      t.timestamps null: false
    end
  end
end
