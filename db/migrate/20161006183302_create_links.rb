class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links, :id => false do |t|
      t.string :id, null: false

      t.string :parent_link,              null: false
      t.string :name, null: true, default: ""

      t.references :user

      t.timestamps
    end

    add_index :links, :name
    add_index :links, :id
    add_index :links, :parent_link

  end
end
