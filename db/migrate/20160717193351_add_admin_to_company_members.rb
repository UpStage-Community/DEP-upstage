class AddAdminToCompanyMembers < ActiveRecord::Migration
  def change
    add_column :company_members, :admin, :bool
    remove_column :users, :role
  end
end
