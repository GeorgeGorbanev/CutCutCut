class AddColumnClicks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :click_count, :integer, :default => 0
  end
end
