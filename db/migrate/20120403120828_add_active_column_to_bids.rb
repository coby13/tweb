class AddActiveColumnToBids < ActiveRecord::Migration
  def change
    add_column :bids, :active, :boolean, :default => false

  end
end
