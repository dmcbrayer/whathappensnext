class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.references :story
      t.boolean :favorite, default: false

      t.timestamps null: false
    end
  end
end
