class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :propertyname
      t.references :user, null: false, foreign_key: true
      t.string :add_l1
      t.string :add_l2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
