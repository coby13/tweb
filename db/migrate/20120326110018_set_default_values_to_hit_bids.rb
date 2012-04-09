class SetDefaultValuesToHitBids < ActiveRecord::Migration
  def up
    change_column :hits, :bidmax,:integer, :default => 0


  end

  def down
  end
end
