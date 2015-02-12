class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :email
      t.string :pic_url
      t.string :url
      t.text :bio
      t.string :password_digest

      t.timestamps
    end
  end
end
