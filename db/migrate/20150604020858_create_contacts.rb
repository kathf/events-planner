class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone, array: true, default: []
      t.string :address, array: true, default: []
      t.string :email
      t.text :comment
      t.timestamps null: false
    end
  end
end
