class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :parent_link,              null: false
      t.string :new_link, null: false
      t.string :name, null: true, default: ""

      t.references :user

      t.timestamps
    end

    add_index :links, :name
    add_index :links, :new_link
    add_index :links, :parent_link

  end
end
