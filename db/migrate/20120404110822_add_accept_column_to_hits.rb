class AddAcceptColumnToHits < ActiveRecord::Migration
  def change
    add_column :hits, :haveaccept, :boolean, :default => false



  end
end
