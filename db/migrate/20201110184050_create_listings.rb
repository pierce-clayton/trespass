class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :price
      t.date :avail_start
      t.date :avail_end
      t.string :description
      t.string :allowed_activities
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
