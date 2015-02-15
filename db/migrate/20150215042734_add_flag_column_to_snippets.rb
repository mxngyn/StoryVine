class AddFlagColumnToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :flagged, :boolean, :default => false
  end
end
