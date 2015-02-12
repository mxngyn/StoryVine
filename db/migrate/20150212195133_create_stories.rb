class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :snippet
      t.references :parent
      t.string :title
      t.references :user, as: :author
      t.boolean :published

      t.timestamps
    end
  end
end
