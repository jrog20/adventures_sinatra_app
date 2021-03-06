class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :full_name
      t.string :preferred_name
      t.string :image_url
      t.text :bio

      t.timestamps null: false
    end
  end
end
