class AddImageColumnsToHit < ActiveRecord::Migration
  def self.up
    change_table :hits do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :hits, :image
  end
end
