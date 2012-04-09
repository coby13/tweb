class AddBidmaxColumnToHit < ActiveRecord::Migration
  def change
    add_column :hits, :bidmax, :integer

  end
end
