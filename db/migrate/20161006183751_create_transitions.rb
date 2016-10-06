class CreateTransitions < ActiveRecord::Migration[5.0]
  def change
    create_table :transitions do |t|
      t.integer :link_id, null: false
      t.string :ip,              null: false, default: ""
      t.string :browser

      t.references :link, :link_id

      t.timestamps
    end
  end
end
