class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name
      t.string :handle
      t.string :image_url
      t.string :url
      t.text :bio
      t.attachment :image

      t.timestamps null: false
    end
  end
end
