class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name, default: ""
      t.string :last_name, default: ""
      t.string :country, default: ""
      t.string :email
      t.string :pic_url, default: ""
      t.string :url, default: ""
      t.text :bio, default: ""
      t.string :password_digest

      t.timestamps
    end
  end
end
