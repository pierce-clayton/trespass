class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.references :user, foreign_key: {on_delete: :cascade}
      t.references :listing, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
