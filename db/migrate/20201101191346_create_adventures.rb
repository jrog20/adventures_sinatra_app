class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :image_url
      t.string :city
      t.string :country
      t.string :date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
