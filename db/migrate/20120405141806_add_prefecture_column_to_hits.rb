class AddPrefectureColumnToHits < ActiveRecord::Migration
  def change
    add_column :hits, :prefecture_id, :string, :null => false

  end
end
