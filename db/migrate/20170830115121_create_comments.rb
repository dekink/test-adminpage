class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :diary_id
      t.text :content
      t.timestamps null: false
    end
  end
end
