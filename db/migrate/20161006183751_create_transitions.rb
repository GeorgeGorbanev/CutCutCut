class CreateTransitions < ActiveRecord::Migration[5.0]
  def change
    create_table :transitions do |t|
      t.belongs_to :link, index: true, :foreign_key => :id
      t.string :link_id
      t.string :ip
      t.string :browser
      t.string :device
      t.string :platform
      t.timestamps
    end
  end
end
