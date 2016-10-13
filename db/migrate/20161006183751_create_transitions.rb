class CreateTransitions < ActiveRecord::Migration[5.0]
  def change
    create_table :transitions do |t|
      t.string :ip,              null: false, default: ""
      t.string :browser

      t.references :link

      t.timestamps
    end
  end
end
