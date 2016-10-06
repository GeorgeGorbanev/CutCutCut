class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.integer :user_id

      t.string :link,              null: false
      t.string :new_link, null: false
      t.string :name, null: true, default: ""

      t.references :user, :user_id

      t.timestamps
    end
  end
end
