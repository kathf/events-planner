class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :event
      t.references :contact
      t.string :name
      t.timestamp :deadline
      t.string :address
      t.decimal :cost, precision: 7, scale: 2
      t.text :comment
      t.timestamps null: false
    end
  end
end
