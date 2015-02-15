class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :flaggable, polymorphic: true, index: true
      t.integer :user_id
      t.boolean :flagged
      t.timestamps null: false
    end
  end
end
