class RemoveOauthFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :provider
  	remove_column :users, :uid
  	remove_column :users, :handle
  	remove_column :users, :image_url
  end
end
