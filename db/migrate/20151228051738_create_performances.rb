class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :production_id
      t.datetime :date

      t.timestamps null: false
    end
  end
end
