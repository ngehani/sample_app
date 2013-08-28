class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
  	# Created by rails generate migration add_remember_token_to_users
  	# This adds and indexes remember_token to the users table
  	add_column :users, :remember_token, :string
    add_index  :users, :remember_token
  end
end
