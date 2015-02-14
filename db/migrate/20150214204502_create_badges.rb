class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.references :user
      t.string :title
    end
  end
end
