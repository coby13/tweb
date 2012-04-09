class CreateNomos < ActiveRecord::Migration
  def change
    create_table :nomos do |t|
      t.string :name

      t.timestamps
    end
  end
end
