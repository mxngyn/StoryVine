class CreateStoryTags < ActiveRecord::Migration
  def change
    create_table :story_tags do |t|
      t.references :tag
      t.references :story

      t.timestamps
    end
  end
end
