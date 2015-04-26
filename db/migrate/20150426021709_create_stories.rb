class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :user
      t.string :title
      t.text :description


      t.timestamps null: false
    end
  end
end
