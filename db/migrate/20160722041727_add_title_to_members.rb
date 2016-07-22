class AddTitleToMembers < ActiveRecord::Migration
  def change
    add_column :company_members, :title, :string
    add_column :production_members, :title, :string
  end
end
