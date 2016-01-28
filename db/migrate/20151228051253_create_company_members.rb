class CreateCompanyMembers < ActiveRecord::Migration
  def change
    create_table :company_members do |t|
      t.integer :company_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
