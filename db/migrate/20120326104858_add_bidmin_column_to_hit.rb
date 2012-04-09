class AddBidminColumnToHit < ActiveRecord::Migration
  def change
    add_column :hits, :bidmin, :integer

  end
end
