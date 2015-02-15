class AddFlagColumnToStories < ActiveRecord::Migration
  def change
    add_column :stories, :flagged, :boolean, :default => false
  end
end
