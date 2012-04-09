class SetDefaultValuesToHitBids1 < ActiveRecord::Migration
  def up
    change_column :hits, :bidmin,:integer, :default => 0
  end

  def down
  end
end
