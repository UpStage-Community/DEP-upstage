class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.integer :company_id
      t.string :title
      t.text :description
      t.string :price_range
      t.string :ticket_url
      t.attachment :image

      t.timestamps null: false
    end
  end
end
