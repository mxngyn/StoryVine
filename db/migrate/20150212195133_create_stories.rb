class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :snippet
      t.references :parent, index: true
      t.integer :author_id
      t.string :title
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end
