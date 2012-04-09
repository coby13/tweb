class AddAcceptColumnToBids < ActiveRecord::Migration
  def change
    add_column :bids, :accept, :boolean

  end
end
