class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone, default: []
      t.string :address, default: []
      t.string :email
      t.text :comment
      t.timestamps null: false
    end
  end
end
