class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :snippet
      t.references :user, as: :author
      t.references :parent, index: true
      t.string :title
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end
