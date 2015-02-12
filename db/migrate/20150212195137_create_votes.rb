class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :story
      t.references :user
      t.boolean :liked

      t.timestamps
    end
  end
end
