class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :phone, :limit => 8
      t.string :email
      t.string :url
      t.string :short_description
      t.text :long_description
      t.attachment :image

      t.timestamps null: false
    end
  end
end
