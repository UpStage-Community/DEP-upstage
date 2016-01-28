class CreateProductionMembers < ActiveRecord::Migration
  def change
    create_table :production_members do |t|
      t.integer :production_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
