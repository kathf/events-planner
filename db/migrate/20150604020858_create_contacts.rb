class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :company
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :address
      t.text :comment
      t.timestamps null: false
    end
  end
end
