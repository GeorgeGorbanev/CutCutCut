class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links, :id => false do |t|
      t.belongs_to :user, index: true, :foreign_key => :id
      t.string :id, null: false, unique: true
      t.string :parent_link,              null: false
      t.string :name, null: true, default: ""
      t.references :user

      t.timestamps
    end

    add_foreign_key :links, :users

    add_index :links, :name
    add_index :links, :id
    add_index :links, :parent_link

  end
end
