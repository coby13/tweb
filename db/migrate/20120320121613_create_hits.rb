class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.string :subject
      t.text :body
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
